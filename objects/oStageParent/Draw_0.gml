/// @description Drawing

draw_surface_ext(back_surface, 0, 0, 1, 1, 0, $ffffff, back_alpha)

if back_mode != 0
	exit

with back {
	if other.entrance_y < screen_height + 40 { // optimizataion
		var __acol, __str, __swid
		__acol = make_color_hsv(background_param - 25, 144, 128)

		for (var i = (other.entrance_x / 2) mod 64 - 64; i < 576; i += 64)
			draw_sprite_ext(sAreaEntrance, 0, i, other.entrance_y, 1, 1, 0, __acol, 1)
 
		__str = other.entrance_caption
		__swid = (string_width(__str) + 6) * 2

		draw_set_halign(0)
		draw_set_valign(1)
		draw_set_color(make_color_hsv(background_param - 25, 190, 200))
		for (var i = other.entrance_x mod __swid - __swid; i < 576; i += __swid)
			draw_text_transformed(i, other.entrance_y + 2, __str, 2, 2, 0)
	}
}
