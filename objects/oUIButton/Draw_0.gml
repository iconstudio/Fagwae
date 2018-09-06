if global.ui_top == id {
	if pressed
		image_index = 2
	else
		image_index = 1
} else {
	image_index = 0
}

var dx = x - ui_width * ui_anchor[0] - 6
var dy = y - ui_height * ui_anchor[1] - 6
ui_draw_sprite_panel(sButton, image_index, 8, dx, dy, ui_width + 12, ui_height + 12)

draw_set_font(fontNormal)
draw_set_halign(1)
draw_set_valign(1)
draw_set_color(0)
draw_text(x, y, caption)
draw_set_font(fontRetro)
