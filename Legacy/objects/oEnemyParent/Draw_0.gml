draw_self()

if 0 < damaged {
	draw_sprite_ext(sprite_index, 1, round(x), round(y), image_xscale, image_yscale, image_angle, $ffffff, image_alpha * damaged)
	damaged *= 0.5
}
