/// @description Drawing UIs
draw_set_alpha(1)
draw_set_color($ffffff)
draw_set_font(fontScore)
draw_set_halign(1)
draw_set_valign(1)

var score_string = string(virtual_score)
draw_text_transformed(SCORE_DX, SCORE_DY, score_string, 1, 1, 0)

var ascore_length = array_length(actual_score)
if 0 < ascore_length {
	var ascore_char_width = string_width(actual_score[0])
	var ascore_dx = (SCORE_DX - ascore_char_width * ascore_length * 0.5)
	for (var i = 0; i < ascore_length; ++i) {
		
	}
}


if global.paused {
	//draw_set_alpha(0.5)
	//draw_set_color($0)
	//draw_rectangle(0, 0, SCREEN_W, SCREEN_H, false)


	draw_set_font(fontPause)
	//draw_text_transformed(pause_title_x, pause_title_y, "- " + global.area_title + " -", 2, 2, 0)
	draw_text_transformed(pause_title_x, pause_title_y, "- paused -", 2, 2, 0)
	draw_set_halign(0)
	pause_menus.enumerate_all(pause_menu_drawer)
}
