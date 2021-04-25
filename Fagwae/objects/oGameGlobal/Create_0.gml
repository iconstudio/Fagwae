capture = -1

global.paused = false
global.pause_stack = 0


function do_pause() {
	global.paused = true
	global.pause_stack++

	instance_deactivate_object(oDrawnSprite)

	if !sprite_exists(capture) and surface_exists(application_surface) {
		capture = sprite_create_from_surface(application_surface, 0, 0, SCREEN_W, SCREEN_H, false, false, 0, 0)
	}
}


function undo_pause() {
	global.pause_stack--

	if global.pause_stack <= 0 {
		global.paused = false
		if sprite_exists(capture)
			sprite_delete(capture)

		instance_activate_object(oDrawnSprite)
	}
}
