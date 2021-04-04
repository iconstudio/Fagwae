/// @description Update
event_inherited()

if moving_mode == 0 {
	if abs(x - x_target) < 4 { // diacc
		moving_mode = 1
	} else if x > x_target { // left
		if hspeed != -2
			hspeed += (-2 - hspeed) * 0.2
	} else if x < x_target { // right
		if hspeed != 2
			hspeed += (2 - hspeed) * 0.2
	}
	pangle += 2
} else if moving_mode == 1 { // await
	if hspeed != 0
		hspeed -= hspeed * 0.125

	if moving_count++ > seconds(1) {
		moving_mode = 2
		moving_count = 0
	}
	pangle += 1
} else if moving_mode == 2 {
	if abs(x - x_begin) < 4 {
		moving_mode = 3
	} else if x > x_begin {
		if hspeed != -2
			hspeed += (-2 - hspeed) * 0.2
	} else if x < x_begin {
		if hspeed != 2
			hspeed += (2 - hspeed) * 0.2
	}
	pangle += 2
} else if moving_mode == 3 { // await
	if hspeed != 0
		hspeed -= hspeed * 0.125

	if moving_count++ > 60 {
		moving_mode = 0
		moving_count = 0
	}
	pangle += 1
}

enemy_arm_fix(pangle)
