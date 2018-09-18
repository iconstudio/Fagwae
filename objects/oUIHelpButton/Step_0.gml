if !instance_exists(oUIWindow) and !instance_exists(pane_instance) and !io_check_pressed_start() and !io_check_pressed_select() and !io_check_buttonL() and !io_check_triggerL() and (io_check_buttonR() or io_check_triggerR()) {
	if image_alpha > 0.7 and dmode == 0 {
		oMainMenu.frame = 0
		pressed = true
		event_perform(ev_mouse, ev_global_left_release)
	}
} else if instance_exists(pane_instance) {
	if dmode == 1 {
		oMainMenu.frame = 0
		if keyboard_check_pressed(vk_backspace) or io_check_pressed_padB() or io_check_pressed_padX() or io_check_pressed_padY() {
			with oUIButtonPane {
				if content_number > 0 {
					for (var i = 0; i < content_number; ++i)
						instance_destroy(contents[i])
				}
			}
			with pane_instance {
				instance_destroy(black)
				instance_destroy()
			}
			dmode = 0
			pane_instance = noone
		} else { // Back
			var pkleft = io_check_pressed_left() or keyboard_check_pressed(vk_left) or keyboard_check_pressed(ord("A"))
			var pkright = io_check_pressed_right() or keyboard_check_pressed(vk_right) or keyboard_check_pressed(ord("D"))

			if instance_exists(button_focus) {
				if pkleft xor pkright {
					with button_focus {
						selected = false
						ui_hover = false
						event_user(1)
					}

					if pkleft	
						button_focus = button_focus.button_prev
					else if pkright
						button_focus = button_focus.button_next
					with button_focus {
						if !selected {
							selected = true
							if callback >= 0
								script_execute(callback, id)
						}
					}
				} // pkleft xor pkright
			} // instance_exists(button_focus)
		} // Back
	} // dmode == 0
}
