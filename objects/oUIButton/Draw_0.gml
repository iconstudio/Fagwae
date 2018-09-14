if !instance_exists(ui_parent) {
	instance_destroy()
	exit
}

var draw_out = false
image_index = 0
if global.ui_top == id {
	if pressed
		image_index = 1
	else
		draw_out = true
}

draw_set_alpha(image_alpha)
draw_sprite_ext(sprite_index, -1, floor(x), floor(y), image_xscale, image_yscale, image_angle, image_blend, image_alpha)

if draw_out {
	draw_set_color($858585)
	draw_rectangle(x, y, x + ui_width, y + ui_height, true)
	draw_rectangle(x + 1, y + 1, x + ui_width - 1, y + ui_height - 1, true)
	draw_rectangle(x + 2, y + 2, x + ui_width - 2, y + ui_height - 2, true)
}

draw_set_font(fontNormal)
draw_set_halign(1)
draw_set_valign(1)
draw_set_color($ffffff)
draw_text(x + ui_width * 0.5, y + ui_height * 0.5, caption)
draw_set_font(fontRetro)
