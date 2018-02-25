/// @description 

if shot_mode == 0 {
	alarm[0] = max(30, 50 - global.stage * 3)

	shot_mode = 1
}
