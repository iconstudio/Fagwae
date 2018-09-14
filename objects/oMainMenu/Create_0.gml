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

reversing_time = seconds(0.5)
event_user(0)
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
