/// @description Initialization
global.qui_master = new QuiEntry(true)
global.qui_master.tr_state = QUI_STATES.IDLE
global.qui_master.set_size(GUI_WIDTH, GUI_HEIGHT)
with global.qui_master {
	close = function() {
		game_end()
	}
}

global.qui_mx = 0
global.qui_my = 0
global.qui_cursor = undefined
global.qui_focused = undefined
global.qui_io_last = QUI_IO_STATES.KEYBOARD
//global.qui_everything = new List()

global.io_mouse_left = false
global.io_mouse_pressed_left = false
global.io_mouse_released_left = false

global.io_left = false
global.io_right = false
global.io_up = false
global.io_down = false
global.io_pressed_left = false
global.io_pressed_right = false
global.io_pressed_up = false
global.io_pressed_down = false

global.io_pressed_fulljump = false
global.io_pressed_jump = false
global.io_released_jump = false

global.io_z = false
global.io_x = false
global.io_c = false
global.io_v = false
global.io_pressed_a = false
global.io_pressed_s = false
global.io_pressed_d = false
global.io_pressed_f = false
global.io_pressed_z = false
global.io_pressed_x = false
global.io_pressed_c = false
global.io_pressed_v = false

global.io_skill_1 = false
global.io_skill_2 = false
global.io_skill_3 = false
global.io_skill_4 = false
global.io_pressed_skill_1 = false
global.io_pressed_skill_2 = false
global.io_pressed_skill_3 = false
global.io_pressed_skill_4 = false

global.io_hook = false
global.io_pressed_hook = false
global.io_pressed_dash = false
global.io_pressed_status = false
global.io_pressed_inventory = false

global.io_yes = false
global.io_pressed_menu = false
global.io_pressed_yes = false
global.io_pressed_no = false
global.io_pressed_back = false

key_z = ord("Z")
key_x = ord("X")
key_c = ord("C")
key_v = ord("V")
key_comma = ord(",")
key_dot = ord(".")

globalvar view_x, view_y;
global.player_x = 0
global.player_y = 0

event_user(0)
