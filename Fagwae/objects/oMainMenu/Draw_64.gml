/// @description Drawing main menu
draw_set_color($ffffff)
child_run(function(Child) {
	if Child.do_draw != null
		Child.do_draw()
})

//if surface_exists(test_surface) draw_surface(test_surface, 0, 0)
