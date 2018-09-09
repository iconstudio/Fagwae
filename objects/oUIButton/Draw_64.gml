if !instance_exists(ui_parent) {
	instance_destroy()
	exit
}

if global.ui_top == id {
	if pressed
		image_index = 2
	else
		image_index = 1
} else {
	image_index = 0
}

draw_set_alpha(image_alpha)
draw_set_alpha($ffffff)
ui_draw_sprite_panel(sButton, image_index, 12, x - 10, y - 10, ui_width + 20, ui_height + 20)

draw_set_font(fontNormal)
draw_set_halign(1)
draw_set_valign(1)
draw_set_color(0)
draw_text(x + ui_width * 0.5, y + ui_height * 0.5, caption)
draw_set_font(fontRetro)
