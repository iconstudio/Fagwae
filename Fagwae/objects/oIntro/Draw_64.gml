if !surface_exists(blur_surface)
	event_user(0)


surface_set_target(blur_surface)
draw_clear_alpha(0, 0.4)
surface_reset_target()

draw_surface(blur_surface, 0, 0)
