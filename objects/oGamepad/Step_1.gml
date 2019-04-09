if gamepad_index != -1 and global.padmeter != 0 {
	gamepad_set_vibration(gamepad_index, global.padmeter, global.padmeter)
	global.padmeter -= global.padmeter * 0.5
}
