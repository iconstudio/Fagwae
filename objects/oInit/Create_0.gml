/// @description Initialize Basic Data, Back-End

// external
#macro file_header $ab
global.profilefile = "profile.dat"
global.network = true

// screen
application_surface_draw_enable(false)
gpu_set_blendenable(true)
draw_set_circle_precision(60)

// general
game_set_speed(60, gamespeed_fps)

globalvar matrix_identical;
matrix_identical = matrix_build_identity()

global.extreme = false
global.diff = 0

// gamepad input
global.Gamepad = -1
global.GamepadType = 0
global.GamepadSprite = array_create(3, sIconControllerXbox, sIconControllerPlayStation, sIconControllerOther)

#macro gamepad_type_xbox 0
#macro gamepad_type_playstation 1
#macro gamepad_type_other 2

#macro gamepad_index global.Gamepad
#macro gamepad_type global.GamepadType
#macro gamepad_sprite global.GamepadSprite[global.GamepadType]

if gamepad_is_supported() {
	var gp_number = gamepad_get_device_count()
	
	if gp_number > 0 {
		for (var i = 0; i < gp_number; ++i) {
			if gamepad_is_connected(i) {
				gamepad_index = i // only pick first controller
				var cerif = string_lower(gamepad_get_description(i))
				if string_pos("xbox", cerif) != 0 {
					gamepad_type = gamepad_type_xbox
				} else if string_pos("playstation", cerif) != 0 {
					gamepad_type = gamepad_type_playstation
				} else {
					gamepad_type = gamepad_type_other
				}
				break
			}
		}
	}
}

// drawing
global.font = font_add_sprite(sFont, 33, 1, 1)
global.fontborder = font_add_sprite(sFontBorder, 33, 1, 1)
draw_set_font(global.font)

global.screen_gui_cx = display_get_gui_width() / 2
global.screen_gui_cy = display_get_gui_height() / 2

profile_clear()

alarm[0] = 1
