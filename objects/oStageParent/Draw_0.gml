/// @description Drawing

if !surface_exists(back_surface)
	event_user(0)

surface_set_target(back_surface)
event_user(1)
surface_reset_target()

draw_surface_ext(back_surface, 0, 0, 1, 1, 0, $ffffff, image_alpha)
