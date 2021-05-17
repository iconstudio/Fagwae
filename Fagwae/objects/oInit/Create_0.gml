/// @description Initialize game
#region General
#macro SCREEN_W 640
#macro SCREEN_H 960
randomize()

#macro GAME_FPS 100
game_set_speed(GAME_FPS, gamespeed_fps)

global.__delta = 0
global.__delta_scale = 1
#endregion


#region Macros
#macro print trace
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
#endregion


#region External
#macro PROFILE_COUNT_DEF 2
#macro PROFILE_COUNT_PAID 4
global.PROFILE = "profile.dat"
global.profile_count = PROFILE_COUNT_DEF
#endregion


#region Flags
global.flag_is_pc = (os_type == os_windows or os_type == os_macosx or os_type == os_linux or os_type == os_win8native)
global.flag_is_mobile = (os_type == os_android or os_type == os_ios)
#endregion


#region Screen
if global.flag_is_mobile {
	display_set_sleep_margin(5)
	window_set_fullscreen(true)
	keyboard_set_map(vk_backspace, vk_escape)
} else if os_browser == browser_not_a_browser {
	display_set_sleep_margin(20)
} else {
	display_set_sleep_margin(30)
}
#endregion


#region Drawing
application_surface_enable(true)
application_surface_draw_enable(false)
surface_depth_disable(true)

global.application_texture = -1


gpu_set_fog(false, $ffffff, 32, 32000)
gpu_set_blendenable(true)
gpu_set_texfilter(false)
gpu_set_cullmode(cull_noculling)


draw_set_color($ffffff)
draw_set_circle_precision(96)
if !shaders_are_supported() {
	throw ("Shader is not supported.")
}
#endregion


#region Shader
global.pause_lit_stage = shader_get_sampler_index(shaderPauseLit, "pscreen")
global.pause_lit_value = shader_get_uniform(shaderPauseLit, "intensity")


global.wave_uniform_time = shader_get_uniform(shaderShockwave, "time")
global.wave_uniform_pos = shader_get_uniform(shaderShockwave, "mouse_pos")
global.wave_uniform_resolution = shader_get_uniform(shaderShockwave, "resolution")

// 파도 안에 비치는 상들의 흔들리는 정도
global.wave_uniform_amplitude = shader_get_uniform(shaderShockwave, "shock_amplitude")
// 파도 안에 비치는 상들의 왜곡도
global.wave_uniform_refraction = shader_get_uniform(shaderShockwave, "shock_refraction")
// 파도의 너비
global.wave_uniform_size = shader_get_uniform(shaderShockwave, "shock_width")
#endregion


#region Effects
#macro ENEMY_BINK_DURATION 0.1


global.ptsystem_top = part_system_create_layer("effect_above", true)
global.ptsystem_player = part_system_create_layer("player_effect", true)
global.ptsystem_player_below = part_system_create_layer("player_effect_below", true)
global.ptsystem_enemy = part_system_create_layer("enemy_effect", true)
global.ptsystem_bottom = part_system_create_layer("effect_below", true)

// White Smoke
global.effect_enemy_smoke_stream_speed = 80 / GAME_FPS
global.pttype_smoke_normal = part_type_create()
part_type_shape(global.pttype_smoke_normal, pt_shape_disk)
part_type_size(global.pttype_smoke_normal, 0.70, 0.80, 0, 0.06)
part_type_orientation(global.pttype_smoke_normal, 0, 0, 0, 0, true)
part_type_color3(global.pttype_smoke_normal, $FFFFFF, $D2D2D2, $000000)
part_type_alpha3(global.pttype_smoke_normal, 1, 1, 0)
part_type_blend(global.pttype_smoke_normal, false)
part_type_life(global.pttype_smoke_normal, seconds(0.1), seconds(0.2))
part_type_speed(global.pttype_smoke_normal, 420 / GAME_FPS, 600 / GAME_FPS, 0, 0)
part_type_direction(global.pttype_smoke_normal, 0, 360, 0, 4)
#endregion


#region UX
#macro GAMEPAD_AXIS_THRESHOLD 0.15

device_mouse_dbclick_enable(false)
keyboard_set_map(vk_numpad2, vk_up)
keyboard_set_map(vk_numpad4, vk_left)
keyboard_set_map(vk_numpad6, vk_right)
keyboard_set_map(vk_numpad8, vk_down)
keyboard_set_map(vk_numpad5, vk_enter)

event_user(0)
#endregion


#region UI
enum MENU_STATUSES { NORMAL, OPENING, CLOSING, STOP = 99 }
enum MENU_ITEM_TYPES { TEXT, SPRITE, CUSTOM = 99 }
#macro MENU_TEXT_HEIGHT 62 // 52 + 10
#endregion


#region Game
enum AREA_INDEXES { SHAPE, FRAME, DISORTED }

globalvar AREA_NAMES;
AREA_NAMES = ["Shape", "Frame", "Disorted"]
global.area_title = AREA_NAMES[0]


global.paused = false


global.px = 0
global.py = 0
global.player_weapon = 0


global.shard_size = 8
var shard_w = global.shard_size, shard_h = global.shard_size
global.shard_w_count = (SCREEN_W div shard_w)
global.shard_h_count = (SCREEN_H div shard_h)


global.__cheat_invincible = false
global.__cheat_powerful = false
global.__cheat_inf_bombs = false


globalvar GAMEPAD_AVAILABLE, GAMEPAD_COUNT, GAMEPAD_FRICTION;
GAMEPAD_AVAILABLE = gamepad_is_supported()
GAMEPAD_COUNT = gamepad_get_device_count()
GAMEPAD_FRICTION = 0.8

global.gamepad_index = -1
global.gamepad_shake = 0

if GAMEPAD_AVAILABLE {
	if 0 < GAMEPAD_COUNT {
		for (var i = 0; i < GAMEPAD_COUNT; ++i) {
			if gamepad_is_connected(i) {
				global.gamepad_index = i // only pick first controller
				gamepad_set_axis_deadzone(i, GAMEPAD_AXIS_THRESHOLD)
				break
			}
		}
	}
}
#endregion


#region Audio
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
#endregion


alarm[0] = 1
