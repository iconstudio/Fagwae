draw_self()

if damaged > 0 {
	draw_sprite_ext(sFrameLineD, image_index, round(x), round(y), image_xscale, image_yscale, image_angle, $ffffff, image_alpha * damaged)
	damaged -= 0.6
}

