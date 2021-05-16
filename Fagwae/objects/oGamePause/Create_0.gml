/// @description Declare pause menus
capture = -1
menu_selection = 0


lit_stage = shader_get_uniform(shaderPauseLit, "intensity")
lit_value = 220 / 256
lit_time = 0
lit_period = 0.8


title_x = SCREEN_W * 0.5
title_y = SCREEN_H * 0.3
item_x = SCREEN_W * 0.4 - 70
item_y = SCREEN_H * 0.3 + 90



function do_gotomain() {
	
}


function do_restart() {
	
}


function do_pause() {
	menu_selection = 0

	global.paused = true
	global.stack++

	if player_generator.is_playing()
		player_generator.pause()

	instance_deactivate_all(true)
	instance_activate_object(oIgnore)

	if !sprite_exists(capture) and surface_exists(application_surface) {
		capture = sprite_create_from_surface(application_surface, 0, 0, SCREEN_W, SCREEN_H, false, false, 0, 0)
	}
}


function undo_pause() {
	if global.stack <= 0 {
		global.paused = false
		if sprite_exists(capture)
			sprite_delete(capture)

		instance_activate_all()

		if player_generator.is_paused()
			player_generator.play()

	} else {
		global.stack--
	}
}


menu = function(caption, predicate) constructor {
	this.caption = caption
	this.predicate = method(other, predicate)
}


menus = new List([
	new menu("Resume", undo_pause),
	new menu("Restart game", do_restart),
	new menu("Go to main menu", do_gotomain)
])

menu_size = menus.get_size()


menu_drawer = method(self, function(i, item) {
	if menu_selection == i
		draw_set_color($ffffff)
	else
		draw_set_color($83104e)
	draw_text(item_x, item_y + i * 50, item.caption)
})