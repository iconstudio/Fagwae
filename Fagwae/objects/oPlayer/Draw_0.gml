if 0 < stun_duration {
	if floor(stun_duration) mod 3 == 0
		draw_self()
} else {
	draw_self()
}


if global.io_crawl and !in_sequence
	draw_sprite_ext(mask_index, -1, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha)


var xscale = image_xscale, yscale = image_xscale
with arm_left
	draw_sprite_ext(sprite_index, 0, x, y, xscale,yscale, image_angle, $ffffff, 1)
with arm_right
	draw_sprite_ext(sprite_index, 0, x, y, xscale,yscale, image_angle, $ffffff, 1)

