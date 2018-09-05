/// @description ui_shared_surface()
/// @function ui_shared_surface

if !surface_exists(global.shared_surface)
	global.shared_surface = surface_create(display_get_gui_width(), display_get_gui_height())

return global.shared_surface
