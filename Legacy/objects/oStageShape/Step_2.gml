/// @description Updating Background
background_param += param_speed
scroll += back_speed
if 144 < scroll {
	scroll -= 144
	rotation -= 42
	deco_hue -= 6
}
back_speed = back_speed_begin + back_speed_gap * back_time / back_period
if back_time < back_period
	back_time++

if 0 < background_param
	back_color = make_color_hsv(color_parse(background_param - 10), 210, 60 * brightness)
else
	back_color = 0
if 7 < ++back_count {
	with instance_create_layer(0, 0, "Background", oBackgroundFader)
		image_blend = other.back_color
	back_count = 0
}
layer_background_blend(background_id, back_color)
