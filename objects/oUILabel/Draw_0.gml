if !instance_exists(ui_parent) {
	instance_destroy()
	exit
}

draw_set_alpha(image_alpha)
draw_set_color(image_blend)
draw_set_font(font)
draw_set_halign(halign)
draw_set_valign(valign)
draw_text(floor(x), floor(y), caption)
draw_set_font(fontRetro)
draw_set_color($ffffff)
