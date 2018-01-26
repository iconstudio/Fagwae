/// @description camera_projection_identity()
/// @function camera_projection_identity 

camera_set_view_mat(camera_get_active(), matrix_identical)
camera_set_proj_mat(camera_get_active(), matrix_identical)
camera_apply(camera_get_active())
