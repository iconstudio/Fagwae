if !instance_exists(ui_parent) {
	instance_destroy()
	exit
}

var darker = 0
with cell {
	if global.ui_top == id && !pressed
		darker = 2
}

draw_sprite_part_ext(sSlider, darker, 40, 0, 8, 8, ui_width - 12, 4, 1, 1, $ffffff, 1)
draw_sprite_part_ext(sSlider, 1, 8, 0, 32, 8, 8, 4, (cell.x - 12) / 32, 1, $ffffff, 1)
draw_sprite_part_ext(sSlider, darker, 8, 0, 32, 8, cell.x, 4, (ui_width - cell.x - 12) / 32, 1, $ffffff, 1)
draw_sprite_part_ext(sSlider, 1, 0, 0, 8, 8, 4, 4, 1, 1, $ffffff, 1)

