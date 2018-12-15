/// @description Gamepad recognize

var type = async_load[? "event_type"]

if type == "gamepad discovered" {
	var index = async_load[? "pad_index"]
	
	if index >= 0 and gamepad_index != index {
		 gamepad_index = index
		 gamepad_setting(index)
		 
		 var description = ""
		 var cerif = string_lower(gamepad_get_description(gamepad_index))
		 if string_pos("xbox", cerif) != 0 {
			 description = "XBOX GAMEPAD"
			 gamepad_type = gamepad_type_xbox
		 } else if string_pos("playstation", cerif) != 0 {
			 description = "PLAYSTATION GAMEPAD"
			 gamepad_type = gamepad_type_playstation
		 } else {
			 description = "OTHER GAMEPAD"
			 gamepad_type = gamepad_type_other
		 }
		 
		 notification_add(gamepad_sprite, "GAMEPAD RECOGNIZED", description)
		 show_debug_message("gamepad plug in")
	}
} else if type == "gamepad lost" {
	var index = async_load[? "pad_index"]
	
	if index == gamepad_index {
		gamepad_index = -1
		
		notification_add(sIconControllerOff, "GAMEPAD DISCONNECTED", "")
		show_debug_message("Gamepad plug off")
	}
}
