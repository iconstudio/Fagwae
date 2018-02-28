/// @description 

if y < y_target {
	y += (y_target - y) / 8
}

if moving_mode == -1 { // at first
	if abs(x - x_target) < 7 {
		x = x_target
		moving_mode = 1 // begin rotating
		alarm[0] = 60
	} else {
		if x_target > x {
			x += 6
		} else if x_target < x {
			x -= 6
		}
	}
} else if moving_mode == 4 {
	if abs(x - xstart) < 4 {
		instance_destroy()
	} else if x > xstart { // left
		if hspeed != -3
			hspeed += (-3 - hspeed) / 8
	} else if x < xstart { // right
		if hspeed != 3
			hspeed += (3 - hspeed) / 8
	}
}
