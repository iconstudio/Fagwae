/// @description Initialize game

// General
game_set_speed(100, gamespeed_fps)
randomize()
global.__delta = 0

#macro print show_debug_message
#macro null undefined
#macro is_null is_undefined
#macro elif else if
#macro this self
#macro Delta global.__delta
#macro NONE 0
#macro RIGHT 1
#macro LEFT -1
#macro UP -1
#macro DOWN 1

// External
#macro PROFILE_COUNT_DEF 2
#macro PROFILE_COUNT_PAID 4
global.PROFILE = "profile.dat"
global.profile_count = PROFILE_COUNT_DEF

// Flags
global.flag_is_pc = (os_type == os_windows or os_type == os_macosx or os_type == os_linux or os_type == os_win8native)
global.flag_is_mobile = (os_type == os_android or os_type == os_ios)

// Screen
if global.flag_is_mobile {
	display_set_sleep_margin(5)
	window_set_fullscreen(true)
	keyboard_set_map(vk_backspace, vk_escape)
} else if os_browser == browser_not_a_browser {
	display_set_sleep_margin(20)
} else {
	display_set_sleep_margin(30)
}

// Drawing
application_surface_enable(true)
application_surface_draw_enable(false)
surface_depth_disable(true)

draw_set_color($ffffff)
gpu_set_fog(false, $ffffff, 32, 32000)
gpu_set_blendenable(true)
gpu_set_texfilter(false)
gpu_set_cullmode(cull_noculling)
draw_set_circle_precision(96)
if !shaders_are_supported() {
	throw ("Shader is not supported.")
}

// Shader
global.wave_uniform_time = shader_get_uniform(shaderShockwave, "time")
global.wave_uniform_pos = shader_get_uniform(shaderShockwave, "mouse_pos")
global.wave_uniform_resolution = shader_get_uniform(shaderShockwave, "resolution")

// 파도 안에 비치는 상들의 흔들리는 정도
global.wave_uniform_amplitude = shader_get_uniform(shaderShockwave, "shock_amplitude")
// 파도 안에 비치는 상들의 왜곡도
global.wave_uniform_refraction = shader_get_uniform(shaderShockwave, "shock_refraction")
// 파도의 너비
global.wave_uniform_size = shader_get_uniform(shaderShockwave, "shock_width")

// UX
device_mouse_dbclick_enable(false)
event_user(1)

keyboard_set_map(vk_numpad2, vk_up)
keyboard_set_map(vk_numpad4, vk_left)
keyboard_set_map(vk_numpad6, vk_right)
keyboard_set_map(vk_numpad8, vk_down)
keyboard_set_map(vk_numpad5, vk_enter)

// UI
#macro SCREEN_W 640
#macro SCREEN_H 960

// Game
global.px = 0
global.py = 0
global.player_weapon = 0

global.area_names = ["Shape", "Frame", "Disorted"]

global.__cheat_invincible = false
global.__cheat_powerful = false
global.__cheat_inf_bombs = false

// Audio
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
