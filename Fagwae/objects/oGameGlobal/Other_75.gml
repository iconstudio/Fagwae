/// @description Recognize gamepad
var type = async_load[? "event_type"]


if type == "gamepad discovered" {
	var index = async_load[? "pad_index"]

	if index >= 0 and global.gamepad_index != index {
		if global.gamepad_index != -1
			gamepad_set_vibration(global.gamepad_index, 0, 0)

		 global.gamepad_index = index


		 var cerif = string_lower(gamepad_get_description(index))
		 print("gamepad plugged in - ", cerif)
	}
} else if type == "gamepad lost" {
	var index = async_load[? "pad_index"]

	if index == global.gamepad_index {
		global.gamepad_index = -1
		print("Gamepad plug off")
	}
}
