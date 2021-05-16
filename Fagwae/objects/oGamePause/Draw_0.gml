/// @description Drawing the paused screen
if sprite_exists(capture) {
	var value = (lit_time / lit_period) * lit_value
	shader_set(shaderPauseLit)
	shader_set_uniform_f(lit_stage, value)
	draw_sprite(capture, 0, 0, 0)
	shader_reset()
}

//draw_set_alpha(0.5)
//draw_set_color($0)
//draw_rectangle(0, 0, SCREEN_W, SCREEN_H, false)


draw_set_font(fontPause)
//draw_text_transformed(title_x, title_y, "- " + global.area_title + " -", 2, 2, 0)
draw_text_transformed(title_x, title_y, "- paused -", 2, 2, 0)
draw_set_halign(0)
menus.enumerate_all(menu_drawer)
