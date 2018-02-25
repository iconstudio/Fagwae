/// @description 

if y > 10 {
	if shot_mode == -1 {
		shot_mode = 0
		alarm[0] = max(20, 60 - global.stage * 6 - global.extreme * 10)
	}
}

if vspeed != 0.7
	speed += (0.7 - vspeed) / 5
