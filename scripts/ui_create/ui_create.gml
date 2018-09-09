/// @description ui_create(x, y, object, [layer])
/// @function ui_create
/// @param x position
/// @param y position
/// @param object id
/// @param [layer] string

var newid
if argument_count >= 4
	newid = instance_create_layer(0, 0, argument[3], oUIDummy)
else
	newid = instance_create_layer(0, 0, "ZUI", oUIDummy)

with newid {
	ui_node_init()
	x = other.x + argument[0]
	y = other.y + argument[1]
	ui_parent = other.id
 
	instance_change(argument[2], true)
}

return newid
