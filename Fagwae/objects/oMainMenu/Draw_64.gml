/// @description Drawing main menu
with global.main_depth {
	var dy = 0
	
	draw_set_color($ffffff)
	for (var i = 0; i < __children.get_size(); ++i) {
		Entry = __children.at(i)
		if Entry == __child_focus
			draw_set_color($8000ff)
		draw_text(30, 80 + dy, Entry.__caption)
		if Entry == __child_focus
			draw_set_color($ffffff)
		dy += Entry.__h
	}
}

//if surface_exists(test_surface) draw_surface(test_surface, 0, 0)
