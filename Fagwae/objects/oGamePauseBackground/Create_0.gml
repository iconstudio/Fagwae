capture = -1
capture_texture = -1


time = 0
period = 0.8

lit_value = 220 / 256


function do_capture() {
	if sprite_exists(capture)
		sprite_delete(capture)

	if surface_exists(application_surface) {
		capture = sprite_create_from_surface(application_surface, 0, 0, SCREEN_W, SCREEN_H, false, false, 0, 0)
		capture_texture = sprite_get_texture(capture, 0)
	}
}
