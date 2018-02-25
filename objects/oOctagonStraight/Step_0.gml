/// @description 

if y > 10 {
	if shot_mode == -1 {
		shot_mode = 0
		alarm[0] = 60 - global.stage * 4
	}
} else if y > 0 {
	if vspeed > 1
		vspeed -= 0.09
	else
		vspeed = 1
}
