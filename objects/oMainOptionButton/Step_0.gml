if instance_exists(oMainMenu) {
	if oMainMenu.frame > 0 and oMainMenu.push[2] <= 0.01 {
		if gamepad_index != -1 and script_exists(shortcut_gamepad) and script_execute(shortcut_gamepad) {
			event_perform(ev_mouse, ev_left_release)
		} else if script_exists(shortcut) and script_execute(shortcut) {
			event_perform(ev_mouse, ev_left_release)
		}

		disable = false
	} else {
		disable = true
	}
} else {
	disable = true
}

if collision_point(mouse_x, mouse_y, id, false, false) {
	if focused_time < focused_period
		focused_time++
} else {
	if focused_time > 0
		focused_time--
}
