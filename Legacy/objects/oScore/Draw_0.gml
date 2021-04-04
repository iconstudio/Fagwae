/// @description Drawing Score
if 0 < score_show_time {
	var _param = 0, _brite = 1
	with oStageParent {
		_param = background_param
		_brite = brightness
	}

	var salpha = score_show_time / score_show_period
	draw_set_alpha(salpha)
	draw_set_halign(0)
	draw_set_valign(1)
	draw_set_color(make_color_hsv(color_parse(_param - 25), 172, 210 * _brite))
	var sstr = string(round(score_virtual))
	var slen = string_length(sstr)
	var sx = (room_width - string_width(sstr) * 6) * 0.5
	var sy = room_height * 0.5
	var tx = 0

	for (var i = 1; i <= slen; ++i) {
		dchr = string_char_at(sstr, i)
		var sscl = min(7, max(-3, 1 + lengthdir_x(score_wave, score_rotation + i * 57)) * 6)
		draw_text_transformed(sx + tx, sy + lengthdir_y(score_wave + 4, _param * 32 + i * 57), dchr, 6, sscl, 0)
		tx += (string_width(dchr) - 1) * 6
	}

	draw_set_alpha(1)
}
