/// @description io_check_pressed_right()
/// @function io_check_pressed_right

if gamepad_index != -1
	return gamepad_button_check_pressed(gamepad_index, gp_padr)

return false
