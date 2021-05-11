if cp_project_enter_paa_time < cp_project_enter_paa_period {
	if !surface_exists(blur_surface)
		event_user(0)


	surface_set_target(blur_surface)
	draw_clear_alpha(0, 0.4)
	//draw_sprite_e
	surface_reset_target()

	draw_surface(blur_surface, 0, 0)
}
