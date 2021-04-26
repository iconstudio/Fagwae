/// @description Drawing UIs
if global.paused {
	draw_set_alpha(0.5)
	draw_set_color($0)
	draw_rectangle(0, 0, SCREEN_W, SCREEN_H, false)

	draw_set_alpha(1)
	draw_set_color($ffffff)
	draw_set_font(fontPause)
	draw_set_halign(1)
	draw_set_valign(1)
	//draw_text_transformed(pause_title_x, pause_title_y, "- " + global.area_title + " -", 2, 2, 0)
	draw_text_transformed(pause_title_x, pause_title_y, "- paused -", 2, 2, 0)
	draw_set_halign(0)
	pause_menus.enumerate_all(pause_menu_drawer)
}
