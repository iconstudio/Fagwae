/// @description Drawing flashing text

draw_set_halign(1)
if type_create == 1 // red
	draw_set_color(make_color_hsv(15 + lengthdir_x(15, rotation), 216, 216))
else if type_create == 2 || type_create == 3 // blue
	draw_set_color(make_color_hsv(145 + lengthdir_x(15, rotation), 216, 216))
else // rainbow
	draw_set_color(make_color_hsv(rotation, 96, 255))

draw_set_alpha(alpha)
draw_text_transformed(x, y, ncaption, (scale * rscale), (scale * rscale), 0)
draw_set_alpha(1)
