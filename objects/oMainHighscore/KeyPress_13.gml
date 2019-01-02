/// @description Goto Main menu
if draw_mode == 0 and rpush[0] < 0.05 {
	alarm[1] = seconds(0.5)
	rfrm = 0
	draw_mode = 1
	audio_play_sound(soundMenuBack, 5, false)
}
