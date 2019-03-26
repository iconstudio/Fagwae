/// @description Update
event_inherited()

if end_time == 0 {
	if mode != MODE_OUT {
		out_period = floor(min(out_period_max, (y - out_target_y) / vspeed * 0.25))
		mode = MODE_OUT
		enemy_arm_fix()
		exit
	}
} else {
	//end_time--
}

if begin_time > 0 {
	begin_time--
} else {
	if mode != MODE_MOVE {
		move_startx = x
		move_starty = y
		move_count_max = 2
		mode = MODE_MOVE
	}
}

switch mode {
	case MODE_STOP:
		//y += area_vspeed
	break

	case MODE_MOVE:
		if move_once_time < move_once_period {
			//x += move_once_atomic * lengthdir_x(move_distance, image_angle)
			y += move_once_atomic * lengthdir_y(move_distance, image_angle)
			//var ratio = (move_once_time++ / move_once_period)
			//x = move_startx + lengthdir_x(move_distance, image_angle) * ratio
			//y = move_starty + lengthdir_y(move_distance, image_angle) * ratio// + move_once_time * area_vspeed
		} else {
			if move_delay_time < move_delay_period {
				move_delay_time++
				//y += area_vspeed
			} else if move_count++ < move_count_max { // continue
				//y += area_vspeed
				move_startx = x
				move_starty = y
				move_once_time = 0
				move_delay_time = 0
			} else { // new pattern
				move_count = 0
				move_delay_time = 0
				if image_angle == 75
					image_angle = 105
				else
					image_angle = 75

				if ((global.extreme and irandom(2) == 0)
				or (!global.extreme and irandom(5) == 0))
				and y < room_height * 0.4 {
					mode = MODE_SPREAD
				} else if ((global.extreme and y < room_height * 0.65)
				or (!global.extreme and y < room_height * 0.5))
				and y < room_height * 0.8 {
					mode = MODE_ATTACK
				} else { // it will move one more time
					move_startx = x
					move_starty = y
					move_count_max = 2 + irandom(1)
					move_once_time = 0
				}
			}
		}
	break

	case MODE_ATTACK:
		//y += area_vspeed
		if attack_time < attack_period {
			attack_time++
		} else {
			attack_time = 0
			move_startx = x
			move_starty = y
			move_count_max = 2 + irandom(2)
			mode = MODE_MOVE
		}
	break

	case MODE_SPREAD:
		//y += area_vspeed
		if spread_time < spread_period {
			spread_time++
		} else {
			spread_time = 0
			move_startx = x
			move_starty = y
			move_count_max = 2 + irandom(2)
			mode = MODE_MOVE
		}
	break

	case MODE_OUT:
		//y += area_vspeed
	break

	default:
	break
}

enemy_arm_fix()
