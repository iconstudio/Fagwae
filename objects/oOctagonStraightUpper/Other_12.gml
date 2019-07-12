/// @description Update
if y < room_height - 20 {
	if shot_phase == -1 {
		shot_phase = 0
		alarm[0] = seconds(max(0.5, 1.2 - global.stage * 0.1))
	}
}
