/// @description ui_get_top(x, y, object)
/// @function ui_get_top
/// @param x position
/// @param y position
/// @param object id

ds_list_clear(global.ui_listbox)
var count = instance_position_list(argument0, argument1, argument2, global.ui_listbox, false)
var top = noone

for (var i = 0; i < count; ++i) {
	var current = global.ui_listbox[| i]

	if top = noone || top.depth > current.depth || top > current
		top = current
}

return top
