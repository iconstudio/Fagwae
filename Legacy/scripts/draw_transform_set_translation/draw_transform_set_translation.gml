/// @description draw_transform_set_translation(xt, yt, zy)
/// @function draw_transform_set_translation 
/// @param xt x value { real }
/// @param yt y value { real }
/// @param zt z value { real }
function draw_transform_set_translation(argument0, argument1, argument2) {

	// build the rotation matrix
	var m = matrix_identical
	m[12] = argument0
	m[13] = argument1
	m[14] = argument2
	matrix_set(matrix_world, m)



}
