/// @description Check inputs
global.io_mouse_left = device_mouse_check_button(0, mb_left)
global.io_mouse_p_left = device_mouse_check_button_pressed(0, mb_left)
global.io_mouse_r_left = device_mouse_check_button_released(0, mb_left)


global.io_left = global.key_left.check()
global.io_right = global.key_right.check()
global.io_up = global.key_up.check()
global.io_down = global.key_down.check()


global.io_p_left = global.key_left.check_pressed()
global.io_p_right = global.key_right.check_pressed()
global.io_p_up = global.key_up.check_pressed()
global.io_p_down = global.key_down.check_pressed()

global.io_p_confirm = global.key_confirm.check_pressed()
global.io_p_back = global.key_back.check_pressed()


global.io_r_left = global.key_left.check_released()
global.io_r_right = global.key_right.check_released()
global.io_r_up = global.key_up.check_released()
global.io_r_down = global.key_down.check_released()


if global.gamepad_index == -1
	exit


if !instance_exists(oPlayer) {
	var j_l_h = global.joy_left_h.get_value()
	var j_l_v = global.joy_left_v.get_value()
	var j_l_is_left = (j_l_h < 0.2)
	var j_l_is_right = (0.2 < j_l_h)
	var j_l_is_up = (j_l_v < 0.2)
	var j_l_is_down = (0.2 < j_l_v)


	global.io_left |= j_l_is_left
	global.io_right |= j_l_is_right
	global.io_up |= j_l_is_up
	global.io_down |= j_l_is_down


	global.io_p_left |= global.joy_left_h.check_pressed() and j_l_is_left
	global.io_p_right |= global.joy_left_h.check_pressed() and j_l_is_right
	global.io_p_up |= global.key_up.check_pressed() and j_l_is_up
	global.io_p_down |= global.key_down.check_pressed() and j_l_is_down


	global.io_r_left |= global.joy_left_h.check_released() and j_l_is_left
	global.io_r_right |= global.joy_left_h.check_released() and j_l_is_right
	global.io_r_up |= global.joy_left_v.check_released() and j_l_is_up
	global.io_r_down |= global.joy_left_v.check_released() and j_l_is_down
}

