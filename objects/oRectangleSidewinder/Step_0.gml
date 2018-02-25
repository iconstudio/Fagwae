/// @description 

if moving_mode == -1 { // from outside
	
} else if moving_mode == 0 {
	if abs(x - x_target) < 4 { // diacc
		moving_mode = 1
		speed = 0
	} else if x > x_target { // left
		if speed != -3
			speed += (-3 - speed) / 5
	} else if x < x_target { // right
		if speed != 3
			speed += (3 - speed) / 5
	}
} else if moving_mode == 1 {
	if abs(x - x_target) < 0.3 {
		x += (x - x_target) / 4
	} else {
		moving_mode = 2
	}
} else if moving_mode == 2 {
	if abs(x - xstart) < 4 { // diacc
		moving_mode = 0
		speed = 0
	} else if x > xstart { // left
		speed = -3
	} else if x < xstart { // right
		speed = 3
	}
}
