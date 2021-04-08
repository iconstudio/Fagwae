/// @description Drawing the application surface
if room != roomEditor {
	var dx = global.app_position[0]
	var dy = global.app_position[1]

	draw_surface_stretched(application_surface, dx, dy, PORT_WIDTH, PORT_HEIGHT)
	if room != roomMain {
		draw_set_color($ffffff)
		draw_rectangle(dx - 1, dy - 1, dx + PORT_WIDTH + 1, dy + PORT_HEIGHT + 1, true)
	}
}
