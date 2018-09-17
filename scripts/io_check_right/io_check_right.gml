/// @description io_check_right()
/// @function io_check_right

if gamepad_index != -1
	return gamepad_button_check(gamepad_index, gp_padr) or (gamepad_axis_value(gamepad_index, gp_axislh) > 0.5 and current_time mod 4 < 2)

return false
