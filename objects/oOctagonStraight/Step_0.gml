if y > 10 {
	if shot_mode == -1 {
		shot_mode = 0
		alarm[0] = shot_period_reset1
	}
} else if y > 0 {
	if vspeed > 1
		vspeed -= 0.09
	else
		vspeed = 1
}
