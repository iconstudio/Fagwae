/// @description Drawing body and rifle

draw_self()
draw_sprite_ext(sFrameDualTurret, 0, round(x), round(y), image_xscale, image_yscale, shot_direction, $ffffff, image_alpha)

if damaged > 0 {
	draw_sprite_ext(sprite_index, 1, round(x), round(y), image_xscale, image_yscale, image_angle, $ffffff, image_alpha * damaged)
	draw_sprite_ext(sFrameDualTurret, 1, round(x), round(y), image_xscale, image_yscale, shot_direction, $ffffff, image_alpha * damaged)
	damaged -= 0.6
}
