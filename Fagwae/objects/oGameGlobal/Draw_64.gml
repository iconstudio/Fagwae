/// @description Drawing UIs
draw_set_alpha(1)
draw_set_color($ffffff)
draw_set_font(fontScore)
draw_set_halign(1)
draw_set_valign(1)

var score_string = string(score_manager.value_virtual)
draw_text(SCORE_DX, SCORE_DY, score_string)


// TODO: reverse
var score_length = score_manager.get_size()
if  0 < score_length {
	ascore_dx = (SCORE_DX - 12 * (score_length - 1))
	score_manager.enumerate_all(function(i, caption) {
		draw_text(ascore_dx + i * 24, SCORE_DY + 40, caption)
	})
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
