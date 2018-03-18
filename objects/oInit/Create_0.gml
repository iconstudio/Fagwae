/// @description Initialize Basic Data, Back-End

// external
#macro file_header $ad
global.profilefile = "profile.dat"
global.network = true

// screen
var width_default = 540, height_default = 960 // 9 : 16

global.__view_width = width_default				// Original Size
global.__view_height = height_default			// Original Size 

if os_type == os_android or os_type == os_ios {
	window_set_fullscreen(true)
	
	var window_width = window_get_width()		// Full size
	var window_height = window_get_width()	// Full size

	var gui_width, gui_height
	if window_width > window_height {				// Landscape (Does not support)
	} else {																// Portrait (Support via option) or Square
		gui_height = floor(window_height / 16) * 16
		gui_width = gui_height * 9 / 16
	}
	window_set_size(window_width, window_height)		// game window
	display_set_gui_size(gui_width, gui_height)			// gui in the game window
	surface_resize(application_surface, global.__view_width, global.__view_height) // application surface is static
}

global.__ttw = display_get_gui_width()		// Adjusted
global.__tth = display_get_gui_height()		// Adjusted

global.screen_gui_cx = global.__ttw * 0.5
global.screen_gui_cy = global.__tth * 0.5

// View is 'entire' screen									(Game)
#macro view_width global.__view_width
#macro view_height global.__view_height
// However GUI fits into 'aspected' screen	(Interface)
#macro screen_width global.__ttw
#macro screen_height global.__tth
application_surface_draw_enable(false)
gpu_set_blendenable(true)
draw_set_circle_precision(60)

globalvar matrix_identical;
matrix_identical = matrix_build_identity()

// ui / ux / drawing
global.font = font_add_sprite(sFont, 33, 1, 1)
global.fontborder = font_add_sprite(sFontBorder, 33, 1, 1)
draw_set_font(global.font)
gpu_set_fog(false, $ffffff, 32, 32000)

// general
game_set_speed(60, gamespeed_fps)
randomize()

// game
global.extreme = false
global.stage = 0 // 0: None, 1 ~ 9: Game, 10: Complete a mode

global.enemy_dictionary = ds_map_create()

global.area_list = [oStageShape1, oStageShape2, oStageShape3]

#macro area_vspeed 0.5625 * 4

event_user(0)

enemy_init_shape()
enemy_init_frame()
enemy_init_arm()

enemy_register(enemy_rapid_1, oRapid, "RAPID PULSER", sRapidNormal, sRapidExtreme, 
4, 500, 1, 0, 0, 0, 0)

enemy_register(enemy_rapid_2, oConfuser, "RAPID PULSER", sRapidNormal, sRapidExtreme, 
10, 600, 1, 0, 0, 0, 0)

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

// audio
switch os_browser {
	case browser_not_a_browser:
		switch os_type {
		case os_windows:
		case os_macosx:
		case os_linux:
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
audio_group_load(audiogroup_game)

audio_loaded = false
if !audio_group_is_loaded(audiogroup_game)
  audio_loaded = true
else
  audio_group_load(audiogroup_game)
