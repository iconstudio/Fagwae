if caption != "" {
	draw_set_alpha(image_alpha)
	draw_set_color(image_blend)
	draw_set_halign(halign)
	draw_set_valign(valign)
	draw_text(x, y, caption)
}
