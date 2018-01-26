/// @description Initialize Basic Data, Back-End

#macro file_header $aa
global.profilefile = "profile.dat"
global.network = true

application_surface_draw_enable(false)
gpu_set_blendenable(true)
draw_set_circle_precision(60)

game_set_speed(60, gamespeed_fps)

globalvar matrix_identical;
matrix_identical = matrix_build_identity()

global.font = font_add_sprite(sFont, 33, 1, 1)
global.fontborder = font_add_sprite(sFontBorder, 33, 1, 1)
draw_set_font(global.font)

global.screen_gui_cx = display_get_gui_width() / 2
global.screen_gui_cy = display_get_gui_height() / 2

global.extreme = false

profile_clear()
achievement_add("First blood", "Get 100,000 point")
achievement_add("First blood", "Get 100,000 point")
achievement_add("First blood", "Get 100,000 point")
achievement_add("First blood", "Get 100,000 point")
achievement_add("First blood", "Get 100,000 point")
achievement_add("First blood", "Get 100,000 point")

alarm[0] = 1
