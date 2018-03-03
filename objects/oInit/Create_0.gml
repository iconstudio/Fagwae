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
global.paused = false
global.extreme = false
global.stage = 0 // 0: None, 1 ~ 9: Game, 10: Complete a mode

global.enemy_dictionary = ds_map_create()

global.area_list = array_create(6, noone)
global.area_list[0] = oStageShape1
global.area_list[1] = oStageShape2
global.area_list[2] = oStageShape2
global.area_list[3] = oStageShape2
global.area_list[4] = oStageShape2
global.area_list[5] = oStageShape2

#macro area_vspeed 0.5625 * 4

#macro enemy_octagon_1		"eoctagon1" // shots 5 (blue octagon mk.1)
#macro enemy_octagon_2		"eoctagon2" // shots 3, 3 times (blue octagon mk.2)
#macro enemy_octagon_3		"eoctagon3" // Going up while shots 3, 3 times (blue octagon mk.3)
#macro enemy_octagon_4		"eoctagon4" // shots 1, 3 times (blue octagon mk.4)
#macro enemy_hexagon_1		"ehexagon1" // shots 1 for each 3 arm_number, 1 times (purple hexagon mk.1)
#macro enemy_hexagon_2		"ehexagon2" // Falling while shots 1 for each 3 arm_number, 1 times (purple hexagon mk.2)
#macro enemy_hexagon_3		"ehexagon3" // shots 3 for each 3 arm_number, 2 times, and change (purple hexagon mk.3)
#macro enemy_spread_1			"espread1" // shots 4, 16 times, and change (green octagon mk.1)
#macro enemy_spread_2			"espread2" // shots 4, 3 times (green octagon mk.2)
#macro enemy_rectangle_1	"erect1" // shots 1, 4 times (coral rectangle mk.1)
#macro enemy_rectangle_2	"erect2" // (coral rectangle mk.2)
#macro enemy_circle_1			"ecircle1" // shots 12 around (gray circle mk.1)
#macro enemy_circle_2			"ecircle2" // Jumping while shots 3 or shots 12 around (gray circle mk.2)
#macro enemy_circle_3			"ecircle3" // shots 12 around to player (gray circle mk.3)

#macro enemy_square_1			"fsquare1" // square
#macro enemy_square_2			"fsquare2" // square with a turret
#macro enemy_line_1				"fline1" // falls
#macro enemy_joint_1			"fjoint1" // falls
#macro enemy_joint_2			"fjoint2" // falls

#macro enemy_arm_hexagon_1 "ahexagon1"
#macro enemy_arm_spread_1 "aspread1"
#macro enemy_arm_rectangle_1 "arect1"
#macro enemy_arm_rectangle_2 "arect2"
#macro enemy_arm_turret_1 "aturret1" // static, slow
#macro enemy_arm_turret_2 "aturret2" // dynamic, slow
#macro enemy_arm_turret_3 "aturret3" // dynamic, fast
#macro enemy_arm_turret_4 "aturret4" // boss 1
#macro enemy_arm_turret_5 "aturret4" // boss 2

#macro enemy_boss_1 "eboss1"
#macro enemy_boss_1A "eboss1a"
#macro enemy_boss_1B "eboss1b"
#macro enemy_boss_1C "eboss1c"
#macro enemy_boss_2 "eboss2"
#macro enemy_boss_2A "eboss2a"
#macro enemy_boss_2B "eboss2b"
#macro enemy_boss_2C "eboss2c"
#macro enemy_boss_3 "eboss3"
#macro enemy_boss_4 "eboss4"
#macro enemy_boss_5 "eboss5"
#macro enemy_boss_6 "eboss6"

enemy_init_shape()

// frames
enemy_register(enemy_square_1, oFrameSquare, "STEEL FRAME", sFrameSquare, sFrameSquare, 
30, 250, 2, 0, 0, 0, 0)

enemy_register(enemy_square_2, oFrameTurretSquare, "STEEL FRAME", sFrameSquare, sFrameSquare, 
33, 400, 2, 0, 0, 0, 0)

enemy_register(enemy_joint_1, oFrameJoint, "STEEL FRAME", sFrameJoint, sFrameJoint, 
20, 300, 2, 0, 0, 0, 0)

enemy_init_arm()

// constants for triggers of the area
#macro areapush_object 0
#macro areapush_enemy 1
#macro areapush_message 2
#macro areapush_script 3
#macro areapush_global 4
#macro areapush_delay 5
#macro LEFT 0
#macro RIGHT 1

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
