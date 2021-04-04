/// @description 

if size - isize > 2
	image_alpha = 1
else
	image_alpha = (size - isize) * 0.5

draw_set_alpha(image_alpha)
draw_set_color(vcol)
draw_shape_doughnut(x, y, vertex, image_angle, size, isize)
draw_set_alpha(1)
