if path_position > 0.4 and shot_mode == -1 {
	shot_mode = 0
	if global.extreme
		alarm[0] = 1
	else
		alarm[0] = seconds(1)
}