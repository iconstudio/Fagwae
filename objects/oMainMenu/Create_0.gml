/// @description Setting up main menu
ui_node_init()
ui_set_size(ui_get_width(oGlobal), ui_get_height(oGlobal))
image_xscale = ui_get_width()
image_yscale = ui_get_height()
instance_create_layer(0, 0, "UI", oUIHelpButton)
instance_create_layer(0, 0, "UI", oUISettingButton)

draw_mode = 0
frame = 0

// title
title_push = 1
title_texture = sprite_get_texture(sTitle, 0)
title_yposition = room_height * 0.5 - 70
title_pos_tleft = room_width * 0.5 - 197
title_pos_tright = room_width * 0.5 + 198
title_pos_bleft = room_width * 0.5 - 230
title_pos_bright = room_width * 0.5 + 230
title_pos_top = room_height * 0.5 - 32
title_pos_bottom = room_height * 0.5 + 72

reversing_time = 0
reversing_period = seconds(0.5)
menu_selected = 0
menu_before = 0
menu_push = 0
menu_scroll = 1
if global.flag_is_pc {
	menu_count = 4
	menu_content = ["START", "STATISTICS", "ACHIEVEMENT", "EXIT"]
} else {
	menu_count = 3
	menu_content = ["START", "STATISTICS", "ACHIEVEMENT"]
}
var menu_width
menu_lbutton_x = array_create(menu_count)
menu_rbutton_x = array_create(menu_count)
for (var k = 0; k < menu_count; ++k) {
	menu_width = string_length(menu_content[k]) * 20
	menu_lbutton_x[k] = room_width * 0.5 - ceil(menu_width * 0.5) - 20
	menu_rbutton_x[k] = room_width * 0.5 + ceil(menu_width * 0.5) + 20
}
menu_current_lbx = menu_lbutton_x[0]
menu_current_rbx = menu_rbutton_x[0]
menu_buttony = room_height * 0.8

push = array_create(3, 1)
flash = array_create(3, 0)
menu_auto = seconds(0.5)
MODE_FADEOUT = 1
MODE_GAME = 2
MODE_STATISTICS = 3
MODE_ACHIEVEMENTS = 4
MODE_EXIT = 5
MODE_RESET = 6

background_color = 0

global.extreme = false
global.stage = 0

audio_stop_all()
global.music_before = noone
global.music_current = noone
music_update(musicMainMenu)
