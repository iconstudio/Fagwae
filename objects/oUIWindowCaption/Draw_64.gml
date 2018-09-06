if !instance_exists(ui_parent) {
	instance_destroy()
	exit
}

draw_sprite_ext(sprite_index, 0, x, y, image_xscale, 1, 0, $ffffff, 1)

draw_set_font(fontNormal)
draw_set_halign(1)
draw_set_valign(1)
draw_set_color($ffffff)
draw_text(x + ui_width * 0.5, y + 10, caption)
draw_set_font(fontRetro)
