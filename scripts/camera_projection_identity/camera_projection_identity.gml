/// @description camera_projection_identity()
/// @function camera_projection_identity 
/// @param w		w of view
/// @param h		h of view
/// @param angle	rotation angle of the projection

var ww = view_wport
var hh = view_hport
var mV = matrix_build_lookat(ww / 2, hh / 2, -16000, ww / 2, hh / 2, 0, 0, 1, 0)
var mP = matrix_build_projection_ortho(ww, hh, 1, 32000)

camera_set_view_mat(camera_get_active(), mV)
camera_set_proj_mat(camera_get_active(), mP)
camera_apply(camera_get_active())

