/// @function draw_transform_add_rotation_x(angle)
function draw_transform_add_rotation_x(Angle) {
	var c = dcos(Angle)
	var s = dsin(Angle)
	var m = matrix_build_identity()
	m[5] = c
	m[6] = -s
	m[9] = s
	m[10] = c

	var mw = matrix_get(matrix_world)
	var mr = matrix_multiply(mw, m)
	matrix_set(matrix_world, mr)
}

/// @function draw_transform_add_rotation_y(angle)
function draw_transform_add_rotation_y(Angle) {
	var c = dcos(Angle)
	var s = dsin(Angle)
	var m = matrix_build_identity()
	m[0] = c
	m[2] = s
	m[8] = -s
	m[10] = c

	var mw = matrix_get(matrix_world)
	var mr = matrix_multiply(mw, m)
	matrix_set(matrix_world, mr)
}

/// @function draw_transform_add_rotation_z(angle)
function draw_transform_add_rotation_z(Angle) {
	var c = dcos(Angle)
	var s = dsin(Angle)
	var m = matrix_build_identity()
	m[0] = c
	m[1] = -s
	m[4] = s
	m[5] = c

	var mw = matrix_get(matrix_world)
	var mr = matrix_multiply(mw, m)
	matrix_set(matrix_world, mr)
}

/// @function draw_transform_add_scaling(xs, ys, zs)
function draw_transform_add_scaling(Xs, Ys, Zs) {
	var m = matrix_build_identity()
	m[0] = Xs
	m[5] = Ys
	m[10] = Zs

	var mw = matrix_get(matrix_world)
	var mr = matrix_multiply(mw, m)
	matrix_set(matrix_world, mr)
}

/// @function draw_transform_add_translation(xt, yt, zt)
function draw_transform_add_translation(Xt, Yt, Zt) {
	var m = matrix_build_identity()
	m[12] = Xt
	m[13] = Yt
	m[14] = Zt

	var mw = matrix_get(matrix_world)
	var mr = matrix_multiply(mw, m)
	matrix_set(matrix_world, mr)
}

/// @function draw_transform_set_identity()
function draw_transform_set_identity() {
	matrix_set(matrix_world, matrix_build_identity())
}

/// @function draw_transform_set_scaling(xs, ys, zs)
function draw_transform_set_scaling(Xs, Ys, Zs) {
	var m = matrix_build_identity()
	m[0] = Xs
	m[5] = Ys
	m[10] = Zs

	matrix_set(matrix_world, m)
}

/// @function draw_transform_set_translation(xt, yt, zt)
function draw_transform_set_translation(Xt, Yt, Zt) {
	var m = matrix_build_identity()
	m[12] = Xt
	m[13] = Yt
	m[14] = Zt

	matrix_set(matrix_world, m)
}

/// @function draw_transform_stack_push()
function draw_transform_stack_push() {
	matrix_stack_push(matrix_get(matrix_world))
}

/// @function draw_transform_stack_pop()
function draw_transform_stack_pop() {
	var m = matrix_stack_top()
	matrix_stack_pop()
	matrix_set(matrix_world, m)
}

/// @function draw_projection_identity()
function draw_projection_identity() {
	var ww = SCREEN_W
	var hh = SCREEN_H
	var mV = matrix_build_lookat(ww * 0.5, hh * 0.5, -hh, ww * 0.5, hh * 0.5, 0, 0, 1, 0)
	var mP = matrix_build_projection_ortho(ww, hh, 1, 32000)
	var cam = camera_get_active()

	camera_set_view_mat(cam, mV)
	camera_set_proj_mat(cam, mP)
	camera_apply(cam)
}


/// @function draw_projection_set(xf, yf, zf, xt, yt, zt, xu, yu, zu, fov, aspect, znear, zfar)
function draw_projection_set(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9, argument10, argument11, argument12) {
	var mV = matrix_build_lookat(argument0, argument1, argument2, 
								 argument3, argument4, argument5,
								 argument6, argument7, argument8)
	var mP = matrix_build_projection_perspective_fov(-argument9, -argument10, argument11, argument12)

	camera_set_view_mat(camera_get_active(), mV)
	camera_set_proj_mat(camera_get_active(), mP)
	camera_apply(camera_get_active())
}

