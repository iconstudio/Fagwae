/// @description Updating Color of Background

if square_saturation > 0
	background_color = make_color_hsv(color_parse(background_saturation - 10), 192 * brightness, 112 * brightness)
else
	background_color = 0
layer_background_blend(background_id, background_color)
