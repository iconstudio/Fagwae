/// @description Fading

if fade_alpha > 0 {
	draw_set_alpha(fade_alpha)
	draw_set_color(0)
	draw_rectangle(0, 0, view_width, view_height, 0)

	if global.screenlock {
		draw_set_alpha(fade_alpha * 3)
		draw_set_color($ffffff)
		draw_set_halign(1)
		draw_set_valign(1)
		draw_text_transformed(global.screen_gui_cx, global.screen_gui_cy - 20, "PAUSED", 3, 3, 0)
	}
}
draw_set_alpha(1)
