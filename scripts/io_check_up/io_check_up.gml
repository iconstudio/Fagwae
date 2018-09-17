/// @description io_check_up()
/// @function io_check_up

if gamepad_index != -1
	return gamepad_button_check(gamepad_index, gp_padu) or (gamepad_axis_value(gamepad_index, gp_axislv) < -0.7 and current_time mod 4 < 2)

return false
