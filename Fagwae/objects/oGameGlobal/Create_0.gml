capture = -1


pause_menu_selection = 0
pause_menus = new List(["Resume", "Restart game", "Go to main menu"])
pause_menu_drawer = method(self, function(i, caption) {
	if pause_menu_selection == i
		draw_set_color($ffffff)
	else
		draw_set_color($8d8d8d)
	draw_text(pause_item_x, pause_item_y + i * 50, caption)
})

pause_title_x = SCREEN_W * 0.5
pause_title_y = SCREEN_H * 0.3
pause_item_x = SCREEN_W * 0.4 - 70
pause_item_y = SCREEN_H * 0.3 + 90

menu_size = pause_menus.get_size()


key_anchor = NONE
key_pin_stop = false
key_pin_duration = -1
key_pin_period_short = 0.1
key_pin_period_long = 0.5
key_pinned = NONE


function do_pause() {
	pause_menu_selection = 0

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
