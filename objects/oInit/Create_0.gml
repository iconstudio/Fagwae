/// @description Initialize Basic Data, Back-End

#macro file_header $cafe
global.profilefile = "profile.dat"
global.network = true

application_surface_draw_enable(false)
gpu_set_blendenable(true)
draw_set_circle_precision(60)

game_set_speed(60, gamespeed_fps)

global.d3dcamera = camera_create()

global.font = font_add_sprite(sFont, 33, 1, 1)
global.fontborder = font_add_sprite(sFontBorder, 33, 1, 1)
draw_set_font(global.font)

instance_create_layer(0, 0, "Screen", oGlobal)

global.screen_gui_cx = display_get_gui_width() / 2
global.screen_gui_cy = display_get_gui_height() / 2

alarm[0] = 1
