/// @description instance_position_top(x, y, object, [list])
/// @function instance_position_top
/// @param x position
/// @param y position
/// @param object id
/// @param [list] list

var instances
if argument_count > 3 {
	instances = argument[3]
	ds_list_clear(instances)
} else {
	instances = ds_list_create()
}

var count = instance_position_list(argument[0], argument[1], argument[2], instances, false)
var top = noone

for (var i = 0; i < count; ++i) {
	var current = instances[| i]

	if top = noone || top.depth > current.depth || top > current
		top = current
}
if argument_count <= 3
	ds_list_destroy(instances)

return top
