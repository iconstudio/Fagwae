/// @description Blinking and drawing
var dx = floor(x), dy = floor(y)

draw_sprite_ext(sprite_index, 0, dx, dy, image_xscale, image_yscale, image_angle, image_blend, image_alpha)
if 0 < blink
	draw_sprite_ext(sprite_index, 1, dx, dy, image_xscale, image_yscale, image_angle, $ffffff, image_alpha * blink / ENEMY_BINK_DURATION)
