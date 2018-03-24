/// @description 

if pattern_before != pattern {
	pattern_before = pattern
	pattern_opened = false
	pattern05_rotation = 0 // former init
	shot_count = 0
}

if fade_mode == 0 {
	damaged = 1

	image_xscale += 0.01 + image_xscale * 0.5
	if image_xscale > 1.5
		fade_mode = 1
} else if fade_mode == 1 {
	image_xscale += (1.4 - image_xscale) * 0.333
}

image_yscale = image_xscale

if instance_exists(parent) and !dead {
	var tx = parent.x + x_fix
	var ty = parent.y + y_fix
	hspeed_target = 1.414
	vspeed_target = 5

	if pattern == 0 {
	} else if pattern == 1 {
		ty = parent.y + y_fix + 50

		if !pattern_opened {
			if global.extreme
				alarm[0] = 20
			pattern_opened = true
		}
	} else if pattern == 2 {
		hspeed_target = 1.61
		ty = parent.y + y_fix + 20

		if !pattern_opened {
			alarm[1] = 41 - global.extreme * 20
			pattern_opened = true
		}
	} else if pattern == 3 {
		vspeed_target = 2
		tx = parent.x + x_fix * 0.5
		ty = parent.y + y_fix + 50

		if parent.hp <= parent.hp_max * 0.5 and !pattern_opened {
			alarm[2] = 30
			pattern_opened = true
		}
	} else if pattern == 4 {
		vspeed_target = 8

		if type_create == parent.pattern04_picked { // go foward
			ty = parent.y + y_fix + 180

			if !pattern_opened {
				alarm[3] = 38 - global.extreme * 8
				pattern_opened = true
			}

			if pattern04_progress++ > 120 {
				if !pattern04_ended {
					if global.extreme {
						for (var i = 0; i < 6; ++i) {
							enemy_shot(x, y, shot_speed, 175 + i * 30, oEnemyBullet2)
							enemy_shot(x, y, shot_speed, 185 + i * 30, oEnemyBullet2)
						}
					} else {
						for (var i = 0; i < 6; ++i) {
							enemy_shot(x, y, shot_speed, 175 + i * 30)
							enemy_shot(x, y, shot_speed, 185 + i * 30)
						}
					}
					pattern04_ended = true
				}
				ty = parent.y + y_fix
			}
		}
	} else if pattern == 5 {
		if type_create == LEFT {
			tx = parent.x + lengthdir_x(width, 225 - pattern05_rotation)
			ty = parent.y + lengthdir_y(width, 225 - pattern05_rotation)
		} else if type_create == RIGHT {
			tx = parent.x + lengthdir_x(width, 315 + pattern05_rotation)
			ty = parent.y + lengthdir_y(width, 315 + pattern05_rotation)
		}

		pattern05_position += 2
		if pattern05_rotation < 110
			pattern05_rotation += 4
		else
			pattern05_rotation = 110

		if !pattern_opened {
			alarm[4] = 40 - global.extreme * 5
			pattern_opened = true
			shot_count = 0
		}
	}

	if abs(tx - x) < hspeed_target + 1
		x = tx
	else if x < tx
		x += hspeed_target
	else if x > tx
		x -= hspeed_target

	if abs(ty - y) < vspeed_target + 1
		y = ty
	else if y < ty
		y += vspeed_target
	else if y > ty
		y -= vspeed_target
}
