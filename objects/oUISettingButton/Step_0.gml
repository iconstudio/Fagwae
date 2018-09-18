if !instance_exists(oUIWindow) and !instance_exists(pane_instance) and !io_check_buttonR() and !io_check_triggerR() and (io_check_pressed_start() or io_check_pressed_select() or (room!= roomGame and (io_check_buttonL() or io_check_triggerL()))) {
	if image_alpha > 0.7 and dmode == 0 {
		if instance_exists(oMainMenu)
			oMainMenu.frame = 0
		pressed = true
		event_perform(ev_mouse, ev_global_left_release)
	}
} else if instance_exists(pane_instance) and dmode == 1 {
	if keyboard_check_pressed(vk_backspace) or io_check_pressed_padB() or io_check_pressed_padX() or io_check_pressed_padY() {
		if instance_exists(oMainMenu)
			oMainMenu.frame = 0
		with pane_instance {
			instance_destroy(black)
			instance_destroy()
		}
		dmode = 0
		pane_instance = noone
	}
}
