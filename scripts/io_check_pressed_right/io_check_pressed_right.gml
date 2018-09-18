/// @description io_check_pressed_right()
/// @function io_check_pressed_right

if gamepad_index != -1
	return gamepad_button_check_pressed(gamepad_index, gp_padr) or (gamepad_axis_value(gamepad_index, gp_axislh) > 0.98 and current_time mod 3 == 0)

return false
