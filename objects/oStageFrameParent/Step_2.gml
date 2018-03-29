/// @description 

event_inherited()

background_param += (0.1 * 200 - 10) / 200
scroll += 0.75
if scroll > 120 {
	scroll -= 120
	rotation -= 42
}

if brightness > 0
	back_color = make_color_hsv(color_parse(background_param - 10), 192, 98 * brightness)
else
	back_color = 0
layer_background_blend(background_id, back_color)
 