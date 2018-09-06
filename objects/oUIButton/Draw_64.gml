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

var sx = floor(ui_parent.x + ui_x)
var sy = floor(ui_parent.y + ui_y)

draw_set_alpha(image_alpha)
var dx = sx - floor(ui_width * ui_anchor[0])
var dy = sy - floor(ui_height * ui_anchor[1])
ui_draw_sprite_panel(sButton, image_index, 12, dx - 10, dy - 10, ui_width + 20, ui_height + 20)

draw_set_font(fontNormal)
draw_set_halign(1)
draw_set_valign(1)
draw_set_color(0)
draw_text(sx, sy, caption)
draw_set_font(fontRetro)
