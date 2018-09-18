if !instance_exists(ui_parent) {
	instance_destroy()
	exit
}

if global.ui_top != id
	hovered = false

if pressed
	image_index = 2
else if (global.ui_top == ui_parent or global.ui_top == id) and !hovered
	image_index = 1
else
	image_index = 0

draw_sprite_ext(sSliderCell, -1, x, y, 1, 1, 0, $ffffff, 1)
