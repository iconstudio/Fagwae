/// @description Input Update
var cgx = device_mouse_x_to_gui(0)
var cgy = device_mouse_y_to_gui(0)

if global.qui_mx != cgx {
	global.qui_mx = cgx
	global.qui_io_last = QUI_IO_STATES.MOUSE
}
if global.qui_my != cgy {
	global.qui_my = cgy
	global.qui_io_last = QUI_IO_STATES.MOUSE
}

var check_key = device_mouse_check_button_pressed(0, mb_left)
if check_key {
	if configuration == "Mobile"
		global.qui_io_last = QUI_IO_STATES.MOUSE
}
global.io_mouse_pressed_left = check_key

var check_prev = check_key
check_key = device_mouse_check_button(0, mb_left)
if check_key and check_prev
	global.qui_io_last = QUI_IO_STATES.MOUSE
global.io_mouse_left = check_key

check_key = device_mouse_check_button_released(0, mb_left)
if check_key
	global.qui_io_last = QUI_IO_STATES.MOUSE
global.io_mouse_released_left = check_key

check_key = keyboard_check(vk_left)
if check_key
	global.qui_io_last = QUI_IO_STATES.KEYBOARD
global.io_left = check_key

check_key = keyboard_check(vk_right)
if check_key
	global.qui_io_last = QUI_IO_STATES.KEYBOARD
global.io_right = check_key

check_key = keyboard_check(vk_up)
if check_key
	global.qui_io_last = QUI_IO_STATES.KEYBOARD
global.io_up = check_key

check_key = keyboard_check(vk_down)
if check_key
	global.qui_io_last = QUI_IO_STATES.KEYBOARD
global.io_down = check_key

global.io_pressed_left = keyboard_check_pressed(vk_left)
global.io_pressed_right = keyboard_check_pressed(vk_right)
global.io_pressed_up = keyboard_check_pressed(vk_up)
global.io_pressed_down = keyboard_check_pressed(vk_down)
if keyboard_check_pressed(vk_numpad1) {
	global.io_pressed_left = true
	global.io_pressed_down = true
} else if keyboard_check_pressed(vk_numpad3) {
	global.io_pressed_right = true
	global.io_pressed_down = true
} else if keyboard_check_pressed(vk_numpad7) {
	global.io_pressed_left = true
	global.io_pressed_up = true
} else if keyboard_check_pressed(vk_numpad9) {
	global.io_pressed_right = true
	global.io_pressed_up = true
}

var check_space = keyboard_check_pressed(vk_space)
var check_escape = keyboard_check_pressed(vk_escape)

global.io_z = keyboard_check(key_z)
global.io_pressed_x = keyboard_check_pressed(key_x)
global.io_pressed_c = keyboard_check_pressed(key_c)

global.io_hook = global.io_z
global.io_pressed_dash = global.io_pressed_x
global.io_pressed_jump = check_space
global.io_released_jump = keyboard_check_released(vk_space)

global.io_pressed_menu = check_escape

global.io_yes = keyboard_check(vk_enter)
check_key = keyboard_check_pressed(vk_enter)
if check_key
	global.qui_io_last = QUI_IO_STATES.KEYBOARD
global.io_pressed_yes = check_key

global.io_pressed_no = check_escape
global.io_pressed_back = global.io_pressed_no
