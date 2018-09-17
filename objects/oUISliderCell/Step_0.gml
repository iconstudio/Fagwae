if !instance_exists(ui_parent) {
	instance_destroy()
	exit
}

if pressed {
	with ui_parent {
		var percent = ui_lerp_filter(max(0, mouse_x - x), 8, (ui_width - 8))
		value = clamp(round(minimum + (maximum - minimum) * percent), minimum, maximum)
	}
}