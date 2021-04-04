/// @description draw_transform_set_rotation_y(angle)
/// @function draw_transform_set_rotation_y 
/// @param angle the angle to rotate { real }
function draw_transform_set_rotation_y(argument0) {

	// get the sin and cos of the angle passed in
	var c = dcos(argument0)
	var s = dsin(argument0)

	// build the rotation matrix
	var m = matrix_identical
	m[0] = c
	m[2] = s
	m[8] = -s
	m[10] = c

	matrix_set( matrix_world, m)




}
