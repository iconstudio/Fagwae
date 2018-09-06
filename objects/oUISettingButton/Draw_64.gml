if global.ui_top == id and dmode == 0 {
	if pressed
		image_blend = $434343
	else
		image_index = $a5a5a5
} else {
	image_blend = $ffffff
}

draw_sprite_ext(sIconSetting, image_index, x, y, image_xscale, image_yscale, 0, image_blend, image_alpha)
