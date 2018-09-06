
if pressed
	image_index = 2
else if global.ui_top == id
	image_index = 1
else
	image_index = 0

draw_sprite_ext(sSliderCell, image_index, 4, 12, 1, 1, 0, $ffffff, 1)
