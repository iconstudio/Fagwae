/// @description Update
if global.io_p_pause {
	with oGameGlobal
		do_resume()

	instance_destroy()
} else {
	key_pinned = NONE
	if 0 < key_pin_duration {
		key_pin_duration -= Delta
	} else {
		if key_pin_stop {
			key_anchor = NONE
			key_pinned = NONE
			key_pin_stop = false
			key_pin_duration = 0
		} else {
			key_pinned = key_anchor
			key_pin_duration = key_pin_period_short
		}
	}


	if !global.io_up and !global.io_down {
		key_anchor = NONE
	}

	if global.io_p_up {
		if key_anchor != UP {
			key_anchor = UP
			key_pinned = UP
			key_pin_stop = false
			key_pin_duration = key_pin_period_long
		}
	}

	if global.io_p_down {
		if key_anchor != DOWN {
			key_anchor = DOWN
			key_pinned = DOWN
			key_pin_stop = false
			key_pin_duration = key_pin_period_long
		}
	}

	if global.io_r_up {
		if key_anchor == UP {
			key_anchor = NONE
			key_pinned = NONE
			key_pin_duration = 0
		}
	}

	if global.io_r_down {
		if key_anchor == DOWN {
			key_anchor = NONE
			key_pinned = NONE
			key_pin_duration = 0
		}
	}


	if key_pinned != NONE {
		if key_pinned == UP {
			if menu_selection == 1 { // don't continue
				menu_selection = 0
				key_anchor = NONE
				key_pinned = NONE
				key_pin_stop = true
			} else {
				if menu_selection == 0 {
					menu_selection = menu_size - 1
				} else {
					menu_selection--
				}
			}
		} elif key_pinned == DOWN {
			if menu_selection == menu_size - 2 { // don't continue
				menu_selection = menu_size - 1
				key_anchor = NONE
				key_pinned = NONE
				key_pin_stop = true
			} else {
				if menu_selection == menu_size - 1 {
					menu_selection = 0
				} else {
					menu_selection++
				}
			}
		}
	}

	if global.io_p_confirm {
		var selected = menus.at(menu_selection)
		if !is_null(selected) {
			var predicate = selected.predicate
			if !is_null(predicate)
				predicate()
		}
	}
}
