intro_frame = 0
intro_push = [0, 0, 0]
intro_projscale = 2
intro_mode = 0
intro_clear = true
have_intro = false
if !global.main_intro {
	global.main_intro = true
	intro = true
} else {
	instance_destroy()
}

// title
title_texture = sprite_get_texture(sTitle, 0)
title_yposition = room_height * 0.5 - 70
title_pos_tleft = room_width * 0.5 - 197
title_pos_tright = room_width * 0.5 + 198
title_pos_bleft = room_width * 0.5 - 230
title_pos_bright = room_width * 0.5 + 230
title_pos_top = room_height * 0.5 - 32
title_pos_bottom = room_height * 0.5 + 72

reversing_period = seconds(0.5)
title_push = 0
for (var i = 0; i < 3; ++i) {
	push[i] = 1
	flash[i] = 0
}
event_user(0)
MODE_FADEOUT = 1
MODE_GAME = 2
MODE_STATISTICS = 3
MODE_ACHIEVEMENTS = 4
MODE_EXIT = 5
MODE_RESET = 6
