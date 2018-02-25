/// @description background_create(index)
/// @function background_create
/// @param index { object }

if !instance_exists(back)
	back = instance_create_layer(0, 0, "Score", argument0)
