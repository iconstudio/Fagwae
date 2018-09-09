if global.ui_top == id and dmode == 0 {
	if pressed
		image_blend = $434343
	else
		image_blend = $a5a5a5
} else {
	image_blend = $ffffff
}

if dmode == 0 {
	if x != 6
		x += (6 - x) * 0.142857
} else if dmode == 1 {
	if !instance_exists(pane_instance)
		dmode = 0
	var tx = -image_xscale * ui_width - 6
	if x != tx
		x += (tx - x) * 0.090909
}

draw_sprite_ext(sIconSetting, image_index, x, y, image_xscale, image_yscale, 0, image_blend, image_alpha)
