/// @description io_check_up()
/// @function io_check_up

if gamepad_index != -1
	return gamepad_button_check(gamepad_index, gp_padu) or gamepad_axis_value(gamepad_index, gp_axislv) < -0.5

return false
