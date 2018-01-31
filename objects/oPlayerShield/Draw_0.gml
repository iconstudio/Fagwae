/// @description 

var draw_size = 23
with parent
	draw_size = min(23, invincible / 2)

var draw_piecepos, draw_color, dx, dy
for (var i = 0; i < 8; ++i) {
	draw_piecepos = (draw_size + 10 + ((i + progress) mod 8) * 8) mod 23
	draw_color = make_color_hsv(172 - i * 3, 216 - brightness, 147 + brightness)
	dx = x - sprite_xoffset
	dy = y - sprite_yoffset - 8

	if draw_piecepos > 0 and draw_piecepos - 23 + draw_size > 0
		draw_sprite_part_ext(sprite_index, i + progress, 0, 0, 92, draw_piecepos - 23 + draw_size, dx, dy, 1, 1, draw_color, 1)

	for (var j = draw_piecepos; j < 69; j += 23) {
		draw_sprite_part_ext(sprite_index, i + progress, 0, j, 92, draw_size, dx, dy + j, 1, 1, draw_color, 1)
		draw_piecepos += 23
	}

	if draw_piecepos < 92
		draw_sprite_part_ext(sprite_index, i + progress, 0, draw_piecepos, 92, min(draw_size, 92 - draw_piecepos), dx, dy + draw_piecepos, 1, 1, draw_color, 1)
}
