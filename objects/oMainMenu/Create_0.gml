/// @description Setting up main menu

ui_node_init()
ui_set_size(ui_get_width(oGlobal), ui_get_height(oGlobal))
image_xscale = ui_get_width()
image_yscale = ui_get_height()

menu_selected = 0
if global.flag_is_pc {
	menu_count = 4
	menu_content = ["START", "STATISTICS", "ACHIEVEMENT", "EXIT"]
} else {
	menu_count = 3
	menu_content = ["START", "STATISTICS", "ACHIEVEMENT"]
}

// title
title_texture_proj = sprite_get_texture(sTitle, 0)
title_pos_proj = view_height * 0.5 - 70
title_pos_tleft = view_width * 0.5 - 197
title_pos_tright = view_width * 0.5 + 198
title_pos_bleft = view_width * 0.5 - 230
title_pos_bright = view_width * 0.5 + 230
title_pos_top = view_height * 0.5 - 32
title_pos_bottom = view_height * 0.5 + 72

reversing_time = seconds(0.5)
event_user(0)
MODE_FADEOUT = 1
MODE_GAME = 2
MODE_STATISTICS = 3
MODE_ACHIEVEMENTS = 4
MODE_EXIT = 5
MODE_RESET = 6

intro = false
intro_frame = 0
intro_push = [0, 0, 0]
intro_projscale = 2
intro_mode = 0
intro_clear = true
have_intro = false

if !global.main_intro {
	global.main_intro = true
	intro = true
	intro_clear = false
	have_intro = true
}

background_color = 0

global.extreme = false
global.stage = 0

audio_stop_all()
global.music_before = noone
global.music_current = noone
music_update(musicMainMenu)
