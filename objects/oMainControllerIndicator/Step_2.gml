if gamepad_index != -1 and (gamepad_button_check(gamepad_index, gp_face1) or gamepad_button_check(gamepad_index, gp_face2)
or gamepad_button_check(gamepad_index, gp_face3 or gamepad_button_check(gamepad_index, gp_face4))
or gamepad_button_check(gamepad_index, gp_start) or gamepad_button_check(gamepad_index, gp_select)
or gamepad_axis_value(gamepad_index, gp_axislh) != 0) {
	last_input_method = INPUT_GAMEPAD
}

image_index = last_input_method
