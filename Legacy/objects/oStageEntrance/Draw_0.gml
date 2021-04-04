x++
y = ystart + (show_time++ / show_period) * (room_height + 50)
with oStageParent {
	var __acol, __str, __swid
	__acol = make_color_hsv(background_param - 25, 144, 128)

	for (var i = (other.x * 0.5) mod 64 - 64; i < 576; i += 64)
		draw_sprite_ext(sStageEntrance, 0, i, other.y, 1, 1, 0, __acol, 1)
 
	__str = other.caption
	__swid = (string_width(__str) + 6) * 2

	draw_set_halign(0)
	draw_set_valign(1)
	draw_set_color(make_color_hsv(background_param - 25, 190, 200))
	for (var i = other.x mod __swid - __swid; i < 576; i += __swid)
		draw_text_transformed(i, other.y, __str, 2, 2, 0)
}
