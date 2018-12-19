if intro_mode == 0 {
	if slide_time < slide_period
		slide_time++
	else
		intro_mode = 1
} else if intro_mode == 1 {
	if slide_wait_time < slide_wait_period {
		slide_wait_time++
	} else {
		if zoom_before_time < zoom_before_period {
			zoom_before_time++
		} else {
			if zoom_time < zoom_period
				zoom_time++
			intro_subsize = 2 - zoom_time / zoom_period
			if intro_subsize == 1
				intro_mode = 2
		}
	}
} else if intro_mode == 2 {
	if centering_time < centering_period {
		centering_time++
	} else {
		title_push = 1
		instance_destroy()
		room_goto_next()
	}
}
