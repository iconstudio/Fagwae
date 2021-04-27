/// @description Update game process
global.io_crawl = global.key_crawl.check()

global.io_p_attack = global.key_attack.check_pressed()
global.io_p_bomb = global.key_bomb.check_pressed()
global.io_p_pause = global.key_pause.check_pressed()


if global.paused {
	if pause_lit_time < pause_lit_period
		pause_lit_time += Delta
	else
		pause_lit_time = pause_lit_period

	if global.io_p_pause {
		undo_pause()
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
				if pause_menu_selection == 1 { // don't continue
					pause_menu_selection = 0
					key_anchor = NONE
					key_pinned = NONE
					key_pin_stop = true
				} else {
					if pause_menu_selection == 0 {
						pause_menu_selection = menu_size - 1
					} else {
						pause_menu_selection--
					}
				}
			} elif key_pinned == DOWN {
				if pause_menu_selection == menu_size - 2 { // don't continue
					pause_menu_selection = menu_size - 1
					key_anchor = NONE
					key_pinned = NONE
					key_pin_stop = true
				} else {
					if pause_menu_selection == menu_size - 1 {
						pause_menu_selection = 0
					} else {
						pause_menu_selection++
					}
				}
			}
		}

		if global.io_confirm {
			var selected = pause_menus.at(pause_menu_selection)
			if !is_null(selected) {
				var predicate = selected.predicate
				if !is_null(predicate)
					predicate()
			}
		}
	}
} else {
	if 0 < pause_lit_time
		pause_lit_time -= Delta
	else
		pause_lit_time = 0

	if os_is_paused() {
		do_pause()
	} elif global.io_p_pause {
		do_pause()
	}
}
