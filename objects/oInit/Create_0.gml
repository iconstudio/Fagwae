/// @description Initialize Basic Data, Back-End

// external
#macro file_header $ae
global.profilefile = "profile.dat"
global.network = true
profile_clear()

global.achievement_count = 0 // 도전과제 갯수
global.achievement = [] // 도전과제에서 저장되는 정보 (불린 아님)
global.achievement_cleared = [] // 도전과제 달성 여부
global.achievement_caption = [] // 제목
global.achievement_description = [] // 설명
global.achievement_updater = [] // 도전과제 검사 스크립트
global.achievement_getter = [] // 도전과제를 지금 달성할 수 있는가

// easy
achievement_add("SHIELD GRINDER", "DIE 15 TIMES\nIN ANY MODE", trophy_check0)
achievement_add("FIRST BLOOD", "GET 100000 POINTS", trophy_check1)
achievement_add("HOW TO FAGWAE", "COMPLETE NORMAL MODE", trophy_check2)
achievement_add("BASIC", "DON'T DIE\nIN NORMAL MODE", trophy_check3)

// hard
achievement_add("GETTING OVER IT", "GET 500000 POINTS", trophy_check4)
achievement_add("GOD MODE", "DON'T DIE\nIN EXTREME MODE", trophy_check5)
achievement_add("GLORIUS MAN", "COMPLETE EXTREME MODE", trophy_check6)
achievement_add("JUNK DEALER", "DESTROY ALL STEAL FRAMES\nIN ANY MODE", trophy_check7)

// other
achievement_add("MARATHON", "PLAY FROM FIRST\n TO LAST AREA", trophy_check8)

// flags
global.flag_is_pc = (os_type == os_windows or os_type == os_macosx or os_type == os_linux or os_type == os_win8native)
global.flag_is_mobile = (os_type == os_android or os_type == os_ios)

// screen
var width_default = 540, height_default = 960 // 9 : 16

global.__view_width = width_default				// Original Size
global.__view_height = height_default			// Original Size 
global.__tts = 1													// Original Size 

if global.flag_is_mobile or window_get_fullscreen() {
	window_set_fullscreen(true)
	
	var window_width = window_get_width()		// Full size
	var window_height = window_get_height()	// Full size

	var gui_width, gui_height
	if window_width > window_height {				// Landscape (Does not support)
		gui_height = floor(window_height / 16) * 16
		gui_width = floor(gui_height * 9 / 16)
	} else {																// Portrait (Support via option) or Square
		gui_height = floor(window_height / 16) * 16
		gui_width = floor(gui_height * 9 / 16)
	}
	window_set_size(window_width, window_height)		// game window
	display_set_gui_size(gui_width, gui_height)			// gui in the game window
	surface_resize(application_surface, global.__view_width, global.__view_height) // application surface is static

	global.__tts = window_width / width_default
} else if os_browser == browser_not_a_browser {
	window_center()
	window_set_position(window_get_x(), 48)
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
#macro screen_scale global.__tts					// Real size
#macro screen_iscale floor(global.__tts)
application_surface_enable(true)
application_surface_draw_enable(false)

globalvar matrix_identical;
matrix_identical = matrix_build_identity()

// UI
draw_set_font(fontRetro)
draw_set_color($ffffff)
draw_set_halign(1)
draw_set_valign(1)

// Drawing
gpu_set_fog(false, $ffffff, 32, 32000)
gpu_set_blendenable(true)
gpu_set_texfilter(false)
gpu_set_cullmode(cull_noculling)
draw_set_circle_precision(60)
if !shaders_are_supported() {
	show_debug_message("Shader is not supported.")
}

// UX
global.__devicemx = 0
global.__devicemy = 0
#macro mouse_gui_x global.__devicemx
#macro mouse_gui_y global.__devicemy
global.main_intro = false

// local drawing
dmode = 0
dalpha = 0

// game
global.extreme = false
global.stage = 0
global.px = 0
global.py = 0
global.pause_counter = 0

#macro area_vspeed 0.5625 * 4

event_user(0)
global.enemy_dictionary = ds_map_create()
enemy_init_shape()
enemy_init_frame()
enemy_init_arm()

enemy_register(enemy_rapid_1, oRapid, "RAPID PULSER", sRapidNormal, sRapidExtreme, 
4, 500, 1, 0, 0, 0, 0)

enemy_register(enemy_rapid_2, oConfuser, "RAPID PULSER", sRapidNormal, sRapidExtreme, 
10, 600, 1, 0, 0, 0, 0)

// general
game_set_speed(60, gamespeed_fps)
randomize()
instance_create_layer(0, 0, "Screen", oGlobal)

// gamepad
instance_create_layer(0, 0, "Screen", oGamepad)

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
