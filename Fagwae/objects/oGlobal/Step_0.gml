/// @description Check inputs
global.io_mouse_left = device_mouse_check_button(0, mb_left)
global.io_mouse_p_left = device_mouse_check_button_pressed(0, mb_left)
global.io_mouse_r_left = device_mouse_check_button_released(0, mb_left)


global.io_left = global.key_left.check()
global.io_right = global.key_right.check()
global.io_up = global.key_up.check()
global.io_down = global.key_down.check()

global.io_confirm = global.key_confirm.check()
global.io_back = global.key_back.check()


global.io_p_left = global.key_left.check_pressed()
global.io_p_right = global.key_right.check_pressed()
global.io_p_up = global.key_up.check_pressed()
global.io_p_down = global.key_down.check_pressed()

global.io_p_confirm = global.key_confirm.check_pressed()
global.io_p_back = global.key_back.check_pressed()

global.__delta = delta_time * 0.000001
