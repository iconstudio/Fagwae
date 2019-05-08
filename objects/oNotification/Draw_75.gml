/// @description Drawing a push notification
var dx = sx - 350 * min(1, alpha * 2)
var dy = 10 + y
var hy = dy + 80

draw_set_alpha(alpha)
draw_set_color(backcolor)
draw_rectangle(dx, dy, sx, hy, false)
draw_set_color(color)
draw_rectangle(dx, dy - 1, sx + 1, hy + 1, true)

var fdx = dx + 28
if sprite_exists(icon) {
	draw_sprite_ext(icon, 0, dx + 8, dy + 8, 1, 1, 0, $ffffff, alpha)
	fdx += 54
} else {
	draw_rectangle(dx, dy, dx + 20, hy, false)
}

draw_set_halign(0)
draw_set_valign(0)
draw_text_transformed(fdx, dy + 8, caption, 1.5, 1.5,  0)
draw_text_transformed(fdx, dy + 40, description, 1.5, 1.5, 0)
