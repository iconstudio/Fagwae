/// @description Initialize game
// external
global.profilefile = "profile.dat"

// flags
global.flag_is_pc = (os_type == os_windows or os_type == os_macosx or os_type == os_linux or os_type == os_win8native)
global.flag_is_mobile = (os_type == os_android or os_type == os_ios)

// screen
display_set_timing_method(tm_countvsyncs)

var width_default = 640, height_default = 960
if global.flag_is_mobile or window_get_fullscreen() {
	display_set_sleep_margin(5)
	window_set_fullscreen(true)
	var window_width = window_get_width()					// Full size
	var window_height = window_get_height()				// Full size
	var gui_width, gui_height
	if window_width > window_height {							// Landscape (Does not support)
		gui_height = floor(window_height / 16) * 16
		gui_width = floor(gui_height * 9 / 16)
	} else {																				// Portrait (Support via option) or Square
		gui_height = floor(window_height / 16) * 16
		gui_width = floor(gui_height * 9 / 16)
	}
	window_set_size(window_width, window_height)		// game window
	display_set_gui_size(gui_width, gui_height)			// gui in the game window
	surface_resize(application_surface, global.__view_width, global.__view_height) // application surface is is_static
} else if os_browser == browser_not_a_browser {
	display_set_sleep_margin(20)
	window_center()
	window_set_position(window_get_x(), 48)
} else {
	display_set_sleep_margin(30)
}

application_surface_enable(true)
application_surface_draw_enable(false)

// UI
global.gui_w = 640
global.gui_h = 960

draw_set_color($ffffff)

// Drawing
gpu_set_fog(false, $ffffff, 32, 32000)
gpu_set_blendenable(true)
gpu_set_texfilter(false)
gpu_set_cullmode(cull_noculling)
draw_set_circle_precision(60)
if !shaders_are_supported() {
	show_debug_message("Shader is not supported.")
}
event_user(1)
surface_depth_disable(true)

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
