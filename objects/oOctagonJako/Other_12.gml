/// @description Update
if path_position > 0.4 and shot_phase == -1 {
	shot_phase = 0
	if global.extreme
		alarm[0] = 1
	else
		alarm[0] = seconds(1)
}
