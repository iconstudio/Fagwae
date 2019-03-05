/// @function main_option_create
/// @description main_option_create(image, index, x, y, [callback], [shortcut], [shortcut_gamepad])
/// @param image { sprite }
/// @param index { integer }
/// @param x { real }
/// @param y { real }
/// @param [callback] { integer }
/// @param [shortcut] { integer }
/// @param [shortcut_gamepad] { integer }
with instance_create_layer(argument[2], argument[3], "UI", oMainOptionButton) {
	sprite_index = argument[0]
	image_index = argument[1]
	if argument_count > 4 {
		callback = argument[4]
		if argument_count > 5 {
			shortcut = argument[5]
			if argument_count > 6
				shortcut_gamepad = argument[6]
		}
	}

	return id
}