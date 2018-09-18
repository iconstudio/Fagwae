
if dmode == 0 {
	if x != room_width - 6
		x += (room_width - 6 - x) * 0.142857
} else if dmode == 1 {
	var tx = room_width + image_xscale * ui_width
	if x != tx
		x += (tx - x) * 0.090909
}

draw_set_alpha(image_alpha)
// $858585 $5c5c5c
if global.ui_top == id and dmode == 0 {
	draw_set_color($5c5c5c)
	var dx = ceil(x) - 5, dy = floor(y) - 5
	var tx = dx + ui_width + 10, ty = dy + ui_height + 10
	if pressed {
		draw_rectangle(dx, dy, tx, ty, false)
	} else {
		draw_rectangle(dx, dy, tx, ty, true)
		draw_rectangle(dx + 1, dy + 1, tx - 1, ty - 1, true)
		draw_rectangle(dx + 2, dy + 2, tx - 2, ty - 2, true)
	}
}

draw_sprite_ext(sprite_index, -1, floor(x), floor(y), image_xscale, image_yscale, 0, $ffffff, image_alpha)
