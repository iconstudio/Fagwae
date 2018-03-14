/// @description 

if pattern_before != pattern {
	pattern_before = pattern
	pattern_opened = false
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
	if pattern == 0 {
		x = parent.x + x_fix
		y = parent.y + y_fix
	} else if pattern == 1 {
		x = parent.x + x_fix
		y = min(y, parent.y + y_fix + 50)

		if !pattern_opened {
			if global.extreme
				alarm[0] = 20
			pattern_opened = true
		}
	} else if pattern == 2 {
		var tx = parent.x + x_fix
		var ty = parent.y + y_fix + 20
		if abs(tx - x) < 3
			x = tx
		else if x < tx
			x += 1.61
		else if x > tx
			x -= 1.61

		if ty != y
			y += (ty - y) / 6

		if !pattern_opened {
			alarm[1] = 41 - global.extreme * 20
			pattern_opened = true
		}
	} else if pattern == 3 {
		var tx = parent.x + x_fix * 0.5
		var ty = parent.y + y_fix + 50
		if abs(tx - x) < 2
			x = tx
		else if x < tx
			x++
		else if x > tx
			x--

		if abs(ty - y) < 2
			y = ty
		else if y < ty
			y++
		else if y > ty
			y--

		if parent.hp < parent.hp_max * 0.6 and !pattern_opened {
			alarm[2] = 30
			pattern_opened = true
		}
	} else if pattern == 4 {
		x = parent.x + x_fix
		var ty
		if type_create == parent.pattern03_picked { // go foward
			ty = parent.y + y_fix + 50
		} else { // fixed
			ty = parent.y + y_fix + 20
		}
		if ty != y
			y += (ty - y) / 8
	}
}
