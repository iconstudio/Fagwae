/// @description Updating Color of Background

if background_param > 0
	back_color = make_color_hsv(color_parse(background_param - 10), 192 * brightness, 98 * brightness)
else
	back_color = 0
