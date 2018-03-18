/// @description Drawing

var i, lx, ly
for (i = dcnt1; i <= 3; ++i) {
	lx = lengthdir_x(1, rotation + i * 42)
	ly = lengthdir_y(1, rotation + i * 42)
	draw_sprite_ext(sBackSquare, 0, view_width * 0.5 + lx * 204, view_height * 0.5 + i * 144 + scroll, 1, 1, ly * 56, make_color_hsv(background_param - 20 + i * 5, 130, 134), brightness)
}
