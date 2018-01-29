/// @description menu_projection(xf, yf, zf, xt, yt, zt, xu, yu, zu, fov, aspect, znear, zfar)
/// @function menu_projection 
/// @param xf	x of from position { real }
/// @param xf	y of from position { real }
/// @param zf	z of from position { real }
/// @param xt		x of to position { real }
/// @param yt		y of to position { real }
/// @param zt		z of to position { real }
/// @param xu		x of up vector { real }
/// @param yu		y of up vector { real }
/// @param zu		z of up vector { real }
/// @param fov		field of view angle { real }
/// @param aspect	aspect ration { real }
/// @param znear	z buffer min { real }
/// @param zfar		z buffer max { real }

var mV = matrix_build_lookat(argument0, argument1, argument2, 
							 argument3, argument4, argument5,
							 argument6, argument7, argument8)
var mP = matrix_build_projection_perspective_fov(-argument9, -argument10, argument11, argument12)

camera_set_view_mat(menu_camera, mV)
camera_set_proj_mat(menu_camera, mP)
camera_apply(menu_camera)
