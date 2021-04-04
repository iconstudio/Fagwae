image_xscale = 0.125
image_yscale = image_xscale
image_alpha = 0.5
image_speed = 0

INPUT_KEYBOARD = 0
INPUT_TOUCH = 1
INPUT_GAMEPAD = 2
last_input_method = INPUT_KEYBOARD

if gamepad_index != -1
	last_input_method = INPUT_GAMEPAD
else if global.flag_is_mobile
	last_input_method = INPUT_TOUCH
else
	last_input_method = INPUT_KEYBOARD
image_index = last_input_method
