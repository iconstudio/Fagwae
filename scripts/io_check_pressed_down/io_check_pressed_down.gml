/// @description io_check_pressed_down()
/// @function io_check_pressed_down

if gamepad_index != -1
	return gamepad_button_check_pressed(gamepad_index, gp_padd) or (gamepad_axis_value(gamepad_index, gp_axislv) > 0.98 and current_time mod 3 == 0)

return false
