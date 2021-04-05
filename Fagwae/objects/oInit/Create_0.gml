/// @description Initialize game
#macro print show_debug_message
#macro null undefined

// external
global.profilefile = "profile.dat"

// flags
global.flag_is_pc = (os_type == os_windows or os_type == os_macosx or os_type == os_linux or os_type == os_win8native)
global.flag_is_mobile = (os_type == os_android or os_type == os_ios)

// screen
var width_default = 640, height_default = 960
if global.flag_is_mobile {
	display_set_sleep_margin(5)
	window_set_fullscreen(true)
} else if os_browser == browser_not_a_browser {
	display_set_sleep_margin(20)
} else {
	display_set_sleep_margin(30)
}

// UI
#macro GUI_W 640
#macro GUI_H 960

// Drawing
application_surface_enable(true)
//application_surface_draw_enable(false)
surface_depth_disable(true)

draw_set_color($ffffff)
gpu_set_fog(false, $ffffff, 32, 32000)
gpu_set_blendenable(true)
gpu_set_texfilter(false)
gpu_set_cullmode(cull_noculling)
draw_set_circle_precision(60)
if !shaders_are_supported() {
	show_debug_message("Shader is not supported.")
}

// UX
device_mouse_dbclick_enable(false)
keyboard_set_map(vk_backspace, vk_escape)
global.pause_stack = 0

// game
global.px = 0
global.py = 0

global.__cheat_invincible = false
global.__cheat_powerful = false
global.__cheat_inf_bombs = false

// general
game_set_speed(100, gamespeed_fps)
randomize()

//instance_create_layer(0, 0, "system", oGlobal)

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

alarm[0] = 1
