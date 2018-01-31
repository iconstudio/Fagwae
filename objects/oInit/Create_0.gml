/// @description Initialize Basic Data, Back-End

// external
#macro file_header $ad
global.profilefile = "profile.dat"
global.network = true

// screen
global.__ttw = display_get_gui_width()
global.__tth = display_get_gui_height()

#macro view_width 450
#macro view_height 800
#macro screen_width global.__ttw
#macro screen_height global.__tth
application_surface_draw_enable(false)
gpu_set_blendenable(true)
draw_set_circle_precision(60)

globalvar matrix_identical;
matrix_identical = matrix_build_identity()

// general
game_set_speed(60, gamespeed_fps)
randomize()

// UX
#macro area_vspeed 0.5625 * 4
gpu_set_fog(false, $ffffff, 32, 32000)

// game
global.extreme = false
global.stage = 0 // 0: None, 1 ~ 9: Game, 10: Complete a mode

#macro areapush_object 0
#macro areapush_message 1
#macro areapush_script 2
#macro areapush_global 3
#macro areapush_delay 4

// gamepad input
global.Gamepad = -1
global.GamepadType = 0
global.GamepadSprite = array_create(3, sIconControllerXbox)
global.GamepadSprite[1] = sIconControllerPlayStation
global.GamepadSprite[2] = sIconControllerOther

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

// audio
switch os_browser {
	case browser_not_a_browser:
		switch os_type {
		case os_windows:
		case os_macosx:
			audio_channel_num(200)
			break
		default:
			audio_channel_num(64)
			break
		}
		break
	default:
		audio_channel_num(16)
		break
}

profile_clear()
instance_create_depth(0, 0, 0, oProfileEntry)
