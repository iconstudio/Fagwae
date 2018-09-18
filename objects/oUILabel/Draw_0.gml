if !instance_exists(ui_parent) {
	if !closable {
		instance_destroy()
		exit
	} else {
		close = true
	}
} else if ui_parent.close {
	close = true
}

if close {
	if animate > 0 {
		animate -= 0.07
	} else {
		instance_destroy()
		exit
	}
} else {
	if animate < 1
		animate += 0.09
	else
		animate = 1
}

draw_set_alpha(image_alpha * ease_in_out_expo(animate))
draw_set_color(image_blend)
draw_set_font(font)
draw_set_halign(halign)
draw_set_valign(valign)
draw_text(floor(x), floor(y), caption)
draw_set_font(fontRetro)
draw_set_color($ffffff)
