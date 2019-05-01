/// @description Drawing
var i, lx, ly, lcolor
for (i = deco_min_opt; i <= deco_count; ++i) {
	lx = lengthdir_x(1, rotation + i * 42)
	ly = lengthdir_y(1, rotation + i * 42)
	lcolor = make_color_hsv(background_param - 20 + i * 5 + deco_hue, 100, 134)

	draw_sprite_ext(sBackSquare, 0, room_width * 0.5 + lx * 204, room_height * 0.5 + i * 144 + scroll, 1, 1, ly * 56, lcolor, brightness)
}
