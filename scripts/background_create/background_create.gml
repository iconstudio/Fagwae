/// @description background_create(index)
/// @function background_create
/// @param index { object }

if !instance_exists(back)
	back = instance_create_depth(0, 0, "Background_Instance_2", argument0)
