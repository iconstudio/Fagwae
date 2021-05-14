if sprite_exists(capture)
	sprite_delete(capture)


if global.gamepad_index != -1
	gamepad_set_vibration(global.gamepad_index, 0, 0)
