
var dx = x - ui_width * ui_anchor[0] - 1
var dy = y - ui_height * ui_anchor[1] - 1

draw_set_alpha(image_alpha)
draw_set_color(image_blend)
draw_rectangle(dx, dy, dx + ui_width - 1, dy + ui_height - 1, false)
