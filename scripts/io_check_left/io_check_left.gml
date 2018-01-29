/// @description io_check_left()
/// @function io_check_left

if gamepad_index != -1
	return gamepad_button_check(gamepad_index, gp_padl) or gamepad_axis_value(gamepad_index, gp_axislh) < -0.5

return false
