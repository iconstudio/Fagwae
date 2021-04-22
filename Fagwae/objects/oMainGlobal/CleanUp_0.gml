/// @description Cleanup
io_clear()
draw_texture_flush()

if surface_exists(global.main_surface)
	surface_free(global.main_surface)
