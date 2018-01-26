/// @description notification_add(sprite, caption, description)
/// @function notification_add
/// @param sprite {real}
/// @param caption {string}
/// @param description {string}

with oGlobal {
	construct[0] = argument0
	construct[1] = argument1
	construct[2] = argument2
	
	event_user(2)
}

show_debug_message(string(argument0) + ": "
+ string(argument1) + ", " + string(argument2))
