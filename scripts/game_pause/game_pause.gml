/// @description game_pause()
/// @function game_pause

with oGlobal {
	if sprite_exists(capture)
		sprite_delete(capture)

	capture = sprite_create_from_surface(application_surface, 0, 0, view_width, view_height, false, false, 0, 0)
}

global.screenlock = true
instance_deactivate_all(true)
instance_activate_object(oIgnore)
