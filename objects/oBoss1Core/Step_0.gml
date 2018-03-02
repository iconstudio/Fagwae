/// @description 

if y >= 170 {
	if vspeed >= 0.05 {
		vspeed -= 0.04
	} else {
		if vspeed != 0 {
			vspeed = 0
			fixy = y
		}
	}
}

if vspeed == 0 && hp > 0 {
	x = screen_width / 2 + lengthdir_x(mdist * 4, angle * 3)
	y = fixy + lengthdir_y(mdist, angle * 6)

	if mdist < 32
		mdist += 0.1
} else {
	y += 0.4
}

if !dead {
	angle += 0.2
	dangle += 2
}
