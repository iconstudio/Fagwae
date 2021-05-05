/// @description Declare pause menus
pause_menu_selection = 0

pause_lit_stage = shader_get_uniform(shaderPauseLit, "intensity")
pause_lit_value = 220 / 256
pause_lit_time = 0
pause_lit_period = 0.8

pause_title_x = SCREEN_W * 0.5
pause_title_y = SCREEN_H * 0.3
pause_item_x = SCREEN_W * 0.4 - 70
pause_item_y = SCREEN_H * 0.3 + 90


function do_gotomain() {
	
}


function do_restart() {
	
}


function do_pause() {
	pause_menu_selection = 0

	global.paused = true
	global.pause_stack++

	if player_generator.is_playing()
		player_generator.pause()

	instance_deactivate_all(true)
	instance_activate_object(oIgnore)

	if !sprite_exists(capture) and surface_exists(application_surface) {
		capture = sprite_create_from_surface(application_surface, 0, 0, SCREEN_W, SCREEN_H, false, false, 0, 0)
	}
}


//
function undo_pause() {
	if global.pause_stack <= 0 {
		global.paused = false
		if sprite_exists(capture)
			sprite_delete(capture)

		instance_activate_all()

		if player_generator.is_paused()
			player_generator.play()

	} else {
		global.pause_stack--
	}
}


pause_menu = function(caption, predicate) constructor {
	this.caption = caption
	this.predicate = method(other, predicate)
}


pause_menus = new List([
	new pause_menu("Resume", undo_pause),
	new pause_menu("Restart game", do_restart),
	new pause_menu("Go to main menu", do_gotomain)
])

menu_size = pause_menus.get_size()


pause_menu_drawer = method(self, function(i, item) {
	if pause_menu_selection == i
		draw_set_color($ffffff)
	else
		draw_set_color($83104e)
	draw_text(pause_item_x, pause_item_y + i * 50, item.caption)
})
