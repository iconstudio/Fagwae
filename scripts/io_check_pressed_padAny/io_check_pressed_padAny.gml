/// @description io_check_pressed_padAny()
/// @function io_check_pressed_padAny

return gamepad_index != -1 and (gamepad_button_check_pressed(gamepad_index, gp_face1) or gamepad_button_check_pressed(gamepad_index, gp_face2) or gamepad_button_check_pressed(gamepad_index, gp_face3) or gamepad_button_check_pressed(gamepad_index, gp_face4))
