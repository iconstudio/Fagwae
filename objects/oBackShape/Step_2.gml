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
