/// @description Updating Background
square_saturation += 0.1
background_param += param_speed
scroll += back_speed
if scroll > 144 {
	scroll -= 144
	rotation -= 42
	square_saturation -= 5
}

if background_param > 0
	back_color = make_color_hsv(color_parse(background_param - 10), 192, 98 * brightness)
else
	back_color = 0
if ++back_count > 7 {
	with instance_create_layer(0, 0, "Background", oBackgroundFader)
		image_blend = other.back_color
	back_count = 0
}
layer_background_blend(background_id, back_color)
