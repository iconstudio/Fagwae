/// @description 

if y < y_target {
	y += (y_target - y) / 8
}

if pmode == -1 { // at first
	if abs(x - x_target) < 7 {
		x = x_target
		pmode = 1 // begin rotating
		alarm[0] = 60
	} else {
		if x_target > x {
			x += 6
		} else if x_target < x {
			x -= 6
		}
	}
	exit
}

if shot_mode == 0 {
	
} else {
	
}
