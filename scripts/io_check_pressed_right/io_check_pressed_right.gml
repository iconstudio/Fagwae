/// @description io_check_pressed_right()
/// @function io_check_pressed_right
if gamepad_index != -1
	return gamepad_button_check_pressed(gamepad_index, gp_padr) or (0.98 < gamepad_axis_value(gamepad_index, gp_axislh) and current_time mod 3 == 0)

return false
