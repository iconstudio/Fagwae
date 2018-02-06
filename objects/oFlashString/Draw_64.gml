/// @description 

draw_set_halign(1)
if type_create == 1
	draw_set_color(make_color_hsv(15 + lengthdir_x(15, rots), 216, 216))
else if type_create == 2 || type_create == 3
	draw_set_color(make_color_hsv(145 + lengthdir_x(15, rots), 216, 216))
else
	draw_set_color(make_color_hsv(rots, 96, 255))

draw_set_alpha(alpha)
draw_text_transformed(x, y, ncaption, (scale * rscale), (scale * rscale), 0)
draw_set_alpha(1)
