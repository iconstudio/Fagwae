/// @description Cleanup
io_clear()
draw_texture_flush()

texture_prefetch(texgrp_game)


if surface_exists(global.main_surface)
	surface_free(global.main_surface)
