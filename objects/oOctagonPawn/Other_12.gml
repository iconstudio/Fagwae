/// @description Update
if y > 10 {
	if shot_mode == -1 {
		shot_mode = 0
		alarm[0] = max(10, 40 - global.stage * 6 - global.extreme * 10)
	}
}
