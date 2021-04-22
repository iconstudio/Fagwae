if 0 < stun_duration {
	if stun_duration mod 3 == 0
		draw_self()
} else {
	draw_self()
}

if global.io_crawl
	draw_sprite_ext(mask_index, -1, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha)
