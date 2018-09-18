if pressed {
	pressed = false

	with ui_parent {
		var percent = ui_lerp_filter(max(0, mouse_x - x), 0, ui_width)
		value = clamp(round(minimum + (maximum - minimum) * percent), minimum, maximum)
		event_user(1)
	}
}
