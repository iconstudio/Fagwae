if instance_exists(oMainMenu) {
	if oMainMenu.frame >= oMainMenu.reversing_period and oMainMenu.push[2] <= 0.01 {
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

var highlight_alpha_target = 0.8 + highlight_time / highlight_period * 0.4
if highlight_alpha != highlight_alpha_target
	highlight_alpha += (highlight_alpha_target - highlight_alpha) * 0.1

if collision_point(mouse_x, mouse_y, id, false, false) {
	if highlight_time < highlight_period
		highlight_time++
} else {
	if highlight_time > 0
		highlight_time--
}
