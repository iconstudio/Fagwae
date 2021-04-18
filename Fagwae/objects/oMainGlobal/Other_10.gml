/// @description Create status
check_menu_inputs = function() {
	var was_left = (arrow_hr_key_anchor == LEFT)
	var was_right = (arrow_hr_key_anchor == RIGHT)
	arrow_current = NONE
	arrow_hr_key_anchor = NONE

	if (global.io_p_left and global.io_right and was_right)
	or (global.io_left and !global.io_right)
	or (!global.io_p_right and global.io_left and was_left) {
		arrow_hr_key_anchor = LEFT
		if key_repeat(LEFT)
			arrow_current = LEFT
	}
	else if (global.io_p_right and global.io_left and was_left)
	or (global.io_right and !global.io_left)
	or (!global.io_p_left and global.io_right and was_right) {
		arrow_hr_key_anchor = RIGHT
		if key_repeat(RIGHT)
			arrow_current = RIGHT
	} else {
		key_repeat(null)
	}

	// repeat the picked key
	if repetive.key != null {
		if repetive.time <= 0 {
			arrow_current = repetive.key
			repetive.time = repetive.duration_short
		} else {
			repetive.time -= Delta
		}
	}

	// move the menu context
	if arrow_current != NONE and !is_null(child_focus) {
		if is_null(child_choice) {
			var Go = null, Prior = get_focus()

			if is_null(Prior) {
				//
			} else {
				if arrow_current == LEFT {
					Go = child_focus.before
					if Go == child_first
						repetive.stop()
				} elif arrow_current == RIGHT {
					Go = child_focus.next
					if Go == child_last
						repetive.stop()
				}
			}

			if Go != null {
				focus_child(Go)
			}
		}
	}

	//io_r_left = global.key_left.check_released()
	//io_r_right = global.key_right.check_released()
	//io_r_up = global.key_up.check_released()
	//io_r_down = global.key_down.check_released()

	if global.io_p_confirm
		event_user(1)

	if global.io_p_back
		event_user(2)
}


menu_fadeout = function() {
	menu_child_execute(function(child) {
		with child
			menu_mode_change(sub_state_fadeout)
	})
}


menu_fadein = function() {
	menu_child_execute(function(child) {
		with child
			menu_mode_change(sub_state_fadein)
	})
}


main_state_idle = new menu_state()
main_state_idle.set_updater(function() {
	check_menu_inputs()
})


main_state_intro = new menu_state()
main_state_intro.set_next(main_state_idle)
main_state_intro.set_updater(function() {
	menu_child_execute(function(child) {
		with child
			menu_mode_change(mode_enter)
	})
})


main_state_dimmed = new menu_state()
main_state_dimmed.set_duration(1.5)
main_state_dimmed.set_updater(function() {
	check_menu_inputs()
})


main_state_fadeout = new menu_state()
main_state_fadeout.set_duration(2.1)
main_state_fadeout.set_next(main_state_dimmed)


main_state_fadein = new menu_state()
main_state_fadein.set_duration(1.2)
main_state_fadein.set_next(main_state_idle)


main_state_exit = new menu_state()
main_state_exit.set_duration(1.6)
main_state_exit.set_initializer(menu_fadeout)
main_state_exit.set_callback(game_end)


lyr_interface = layer_get_id("interface")

add_main_entry = function(mnobj, ox, oy) {
	return menu_child_add(instance_create_layer(ox, oy, lyr_interface, mnobj))
}
