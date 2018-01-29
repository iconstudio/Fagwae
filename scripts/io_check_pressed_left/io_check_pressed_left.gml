/// @description io_check_pressed_left()
/// @function io_check_pressed_left

if gamepad_index != -1
	return gamepad_button_check_pressed(gamepad_index, gp_padl)

return false
