/// @description Drawing

if !surface_exists(back_surface)
	event_user(0)

surface_set_target(back_surface)
event_user(1)
surface_reset_target()

draw_surface_ext(back_surface, 0, 0, 1, 1, 0, $ffffff, image_alpha)

if score_alpha > 0 {
	draw_set_alpha(max(score_alpha, 0))
	draw_set_halign(0)
	draw_set_valign(1)
	draw_set_color(make_color_hsv(color_parse(background_param - 25), 172, 210))
	var sstr = string(round(global.vscore))
	var slen = string_length(sstr)
	var sx = (screen_width - string_width(sstr) * 6) * 0.5
	var sy = screen_height * 0.5
	var tx = 0

	for (var i = 1; i <= slen; ++i) {
		dchr = string_char_at(sstr, i)
		var sscl = min(7, max(-3, 1 + lengthdir_x(score_wave, score_rotation + i * 57)) * 6)
		draw_text_transformed(sx + tx, sy + lengthdir_y(score_wave + 4, background_param * 32 + i * 57), dchr, 6, sscl, 0)
		tx += (string_width(dchr) - 1) * 6
	}

	draw_set_alpha(1)
}
