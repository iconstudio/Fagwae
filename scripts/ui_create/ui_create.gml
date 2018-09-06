/// @description ui_create(x, y, object, [layer])
/// @function ui_create
/// @param x position
/// @param y position
/// @param object id
/// @param [layer] string

var position = [x - ui_width * ui_anchor[0] + argument[0], y - ui_height * ui_anchor[1] + argument[1]]

var newid
if argument_count >= 4
	newid = instance_create_layer(position[0], position[1], argument[3], oUIDummy)
else
	newid = instance_create_layer(position[0], position[1], "ZUI", oUIDummy)

with newid {
	ui_node_init()
	ui_parent = other.id
 
	instance_change(argument[2], true)
}

return newid
