/// @description io_check_down()
/// @function io_check_down
function io_check_down() {
	if gamepad_index != -1
		return gamepad_button_check(gamepad_index, gp_padd) or 0.5 < gamepad_axis_value(gamepad_index, gp_axislv)

	return false



}
