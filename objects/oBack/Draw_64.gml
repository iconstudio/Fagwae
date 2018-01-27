/// @description Drawing score

draw_set_alpha(max(score_alpha, 0))
draw_set_halign(0)
draw_set_valign(1)
draw_set_color(make_color_hsv(color_parse(background_saturation - 25), 172, 180))
var sstr = string(round(global.vscore))
var slen = string_length(sstr)
var sx = screen_width / 2 - string_width(sstr) / 2
var sy = screen_height / 2
var tx = 0

for (i = 1; i <= slen; ++i) {
	dchr = string_char_at(sstr, i)
	draw_text_transformed(sx + tx, sy + lengthdir_y(score_wave + 4, background_saturation * 32 + i * 57), dchr, 1, (1 + lengthdir_x(score_wave, score_rotation + i * 57)), 0)
	tx += string_width(dchr)
}

draw_set_alpha(1)
