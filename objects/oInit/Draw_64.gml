/// @description Loading

//draw_sprite_ext(sIconLarge, 0, view_width * 0.5, view_height * 0.5, 1, 1, 0, $ffffff, 1)

if dalpha > 0 {
	draw_set_alpha(dalpha)
	draw_text_transformed(screen_width * 0.5, screen_height * 0.5, "PLEASE WAIT", 3, 3, 0)
	draw_set_alpha(1)
}
