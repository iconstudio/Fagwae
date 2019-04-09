event_inherited()

background_param += param_speed
scroll += 2.5
if scroll >= deco_height {
	scroll -= deco_height
}

if current_saturation > target_saturation
	current_saturation -= 0.8
else
	current_saturation = target_saturation

if current_value > target_value
	current_value -= 0.2
else
	current_value = target_value

if brightness > 0
	back_color = make_color_hsv(color_parse(background_param - 10), current_saturation, current_value * brightness)
else
	back_color = 0
if ++back_count > back_factor {
	with instance_create_layer(0, 0, "Background", oBackgroundFader)
		image_blend = other.back_color
	back_count = 0
}
if back_factor < 40
	back_factor += 0.5
else
	back_factor = 40

//layer_background_blend(background_id, back_color)
 