/// @description ui_get_top(x, y, object)
/// @function ui_get_top
/// @param x position
/// @param y position
/// @param object id

ds_list_clear(ui_listchecker)
var count = instance_position_list(argument0, argument1, argument2, ui_listchecker, false)
var top = noone

for (var i = 0; i < count; ++i) {
	var current = ui_listchecker[| i]

	if top = noone || top.depth > current.depth || top > current
		top = current
}

return top
