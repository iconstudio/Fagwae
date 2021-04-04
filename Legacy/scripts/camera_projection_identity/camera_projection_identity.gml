/// @description camera_projection_identity()
/// @function camera_projection_identity 
function camera_projection_identity() {
	//*

	var ww = room_width
	var hh = room_height
	var mV = matrix_build_lookat(ww * 0.5, hh * 0.5, -hh, ww * 0.5, hh * 0.5, 0, 0, 1, 0)
	var mP = matrix_build_projection_ortho(ww, hh, 1, 32000)

	camera_set_view_mat(camera_get_active(), mV)
	camera_set_proj_mat(camera_get_active(), mP)
	camera_apply(camera_get_active())



}
