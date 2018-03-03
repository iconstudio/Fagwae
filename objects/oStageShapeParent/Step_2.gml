/// @description Updating Background

event_inherited()

if !available
	exit

square_saturation += 0.1
background_param += (0.1 * 192 - 5) / 192
scroll += 0.75
if scroll > 144 {
	scroll -= 144
	rotation -= 42
	square_saturation -= 5
}

if background_param > 0
	back_color = make_color_hsv(color_parse(background_param - 10), 192 * brightness, 98 * brightness)
else
	back_color = 0
