if !instance_exists(ui_parent) {
	instance_destroy()
	exit
}

if global.ui_top != id and global.ui_top != cell
	hovered = false

var darker = 0
if value == maximum {
	darker = 2
} else if !hovered {
	if (global.ui_top == id or global.ui_top == cell) and !pressed
		darker = 1
}

draw_sprite_ext(sprite_index, darker, x, y, image_xscale, image_yscale, 0, image_blend, image_alpha)
if value > minimum and value < maximum {
	draw_sprite_ext(sprite_index, 2, x, y, (cell.x - x) / ui_width * image_xscale, image_yscale, 0, image_blend, image_alpha)
}
