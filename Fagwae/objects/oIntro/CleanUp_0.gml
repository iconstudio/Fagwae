/// @description Cleanup
io_clear()
draw_texture_flush()


if surface_exists(blur_surface)
	surface_free(blur_surface)
