/// @description Setting up main menu
window_set_cursor(cr_default)
draw_mode = 0
frame = 0

option_scale = 0.125
option_cstartx = 12
option_gab = floor(option_scale * 256) + 16
instance_create_layer(room_width * 0.5, room_height * 0.8, "UI", oMainStartButton)
main_option_create(sIconOptionMusic, global.setting_music > 0, option_cstartx, 8, script_callback_toggle_music, script_callback_shortcut_music, io_check_pressed_down)
main_option_create(sIconOptionSFX, global.setting_sfx > 0, option_cstartx + option_gab, 8, script_callback_toggle_sfx, script_callback_shortcut_sfx, io_check_pressed_right)
main_option_create(sIconOptionGraphic, global.setting_effect > 0, option_cstartx + option_gab * 2, 8, script_callback_toggle_effect, script_callback_shortcut_effect, io_check_pressed_left)
//main_option_create(sIconOptionProfile, 0, room_width - option_cstartx - option_gab + 16, 8, script_callback_profile, script_callback_shortcut_profile, io_check_pressed_up)
//main_option_create(sIconOptionHelp, 0, option_cstartx, room_height - option_gab + 8, -1, script_callback_shortcut_help, io_check_pressed_select)
instance_create_layer(room_width - option_cstartx - option_gab + 16, room_height - option_gab + 8, "UI", oMainControllerIndicator)

reversing_time = 0
reversing_period = seconds(1)

push = array_create(3, 1)
flash = array_create(3, 0)
menu_flash_semi_duration = seconds(0.2)
menu_flash_duration = seconds(0.25)
MODE_FADEOUT = 1
MODE_GAME = 2
MODE_HELP = 3
MODE_PROFILE = 4
MODE_EXIT = 5
MODE_RESET = 6

global.extreme = false
global.stage = 0

// sound
audio_stop_all()
global.music_before = noone
global.music_current = noone
music_update(musicMainMenu)

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
background_color = $0
