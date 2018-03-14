/// @description 

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
		x = parent.x + x_fix
		var ty = parent.y + y_fix + 20
		if ty < y
			y += (ty - y) / 6

	}
}
