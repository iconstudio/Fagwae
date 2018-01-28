/// @description Drawing background colors

with back {
	draw_set_alpha(1)
	draw_set_color(back_color)
	draw_rectangle(-32, -32, view_width + 32, view_height + 32, false)

	var i, lx, ly
	for (i = dcnt1; i <= 2; ++i) {
		lx = lengthdir_x(1, rotation + i * 42)
		ly = lengthdir_y(1, rotation + i * 42)
		draw_sprite_ext(sBackSquare, 0, 225 + lx * 204, 500 + i * 144 + scroll, 1, 1, ly * 56, make_color_hsv(background_param - 20 + i * 5, 130, 134), brightness)
	}
}

event_inherited()
