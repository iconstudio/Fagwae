/// @description Controls
var Wall_on_left = check_solid_horizontal(-1)
var Wall_on_right = check_solid_horizontal(1)
var Wall_on_front = check_solid_horizontal(img_xscale)
var Wall_on_back = check_solid_horizontal(-img_xscale)

var was_left = move_key_anchor == LEFT, was_right = move_key_anchor == RIGHT
move_key_anchor = NONE
if !global.io_left and !global.io_right {
}
else if (global.io_pressed_left and global.io_right and was_right)
or (global.io_left and !global.io_right)
or (!global.io_pressed_right and global.io_left and was_left) {
	move_key_anchor = LEFT
}
else if (global.io_pressed_right and global.io_left and was_left)
or (global.io_right and !global.io_left)
or (!global.io_pressed_left and global.io_right and was_right) {
	move_key_anchor = RIGHT
}

switch action_status {
	case PLAYER_ACTION_MODES.IDLE:
		if global.io_hook and Wall_on_front {
			action_status = PLAYER_ACTION_MODES.HOOK
			img_xscale *= -1
			velocity_x = 0
			velocity_y = 0
			break
		}
		
		if velocity_x != 0 {
			if 0 < move_forbid_time {
				move_forbid_time--
			} else if !Wall_on_front {
				var mover = move_key_anchor
				if mover != 0 {
					if mover == LEFT {
						if 0 < velocity_x and velocity_x < move_speed {
							velocity_x = 0
						} else if -move_speed < velocity_x {
							velocity_x -= move_accel
							if velocity_x < -move_speed
								velocity_x = -move_speed
						}
					} else { // RIGHT
						if -move_speed < velocity_x and velocity_x < 0 {
							velocity_x = 0
						} else if velocity_x < move_speed {
							velocity_x += move_accel
							if move_speed < velocity_x
								velocity_x = move_speed
						}
					}
					move_dir = mover
					friction_x = 0
				}
			}
			if move_speed * 2 < abs(velocity_x)
				img_xscale = sign(velocity_x)
			else
				img_xscale = move_dir
		}

		if global.io_pressed_jump
			jump()
	break

	case PLAYER_ACTION_MODES.SPRING:
		if 0 < action_time
			action_time--
		else
			action_status = PLAYER_ACTION_MODES.IDLE
	break

	case PLAYER_ACTION_MODES.HOOK:
		velocity_x = 0
		velocity_y = 0
		if !Wall_on_back {
			action_status = PLAYER_ACTION_MODES.IDLE
			break
		}

		if global.io_pressed_jump
			jump()
	break

	case PLAYER_ACTION_MODES.LADDER:
		if move_key_anchor != NONE
			img_xscale = move_key_anchor

		if global.io_pressed_jump
			jump()
	break

	default:
	
	break
}

