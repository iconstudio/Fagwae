if !instance_exists(ui_parent) {
	instance_destroy()
	exit
}

if pressed {
	with ui_parent {
		var percent = ui_lerp_filter(global.__zui_mx - __dx, 8 * ui_x, (ui_width - 8) * ui_x)
		value = clamp(round(minimum + (maximum - minimum) * percent), minimum, maximum)
	}
}

