/// @description show_flashstring(x, y, caption, type)
/// @function show_flashstring
/// @param x { real }
/// @param y { real }
/// @param caption { string }
/// @param type { integer }

with instance_create_layer(argument0, argument1, "UI", oFlashString) {
	ncaption = argument2
	ctype = argument3
	event_user(0)
}
