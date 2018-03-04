/// @description game_resume()
/// @function game_resume

global.screenlock = false
instance_activate_all()

with oGlobal {
	surface_set_target(surf)
	draw_sprite(capture, 0, 0, 0)
	draw_surface_ext(application_surface, 0, 0, 1, 1, 0, $ffffff, 1)
	surface_reset_target()
}
