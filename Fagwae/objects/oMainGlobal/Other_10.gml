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
	if arrow_current != NONE {
	
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

MAIN_STATE_NORMAL = new menu_state()
MAIN_STATE_NORMAL.update = function() {
	check_menu_inputs()
}

MAIN_STATE_INTRO = new menu_state()
MAIN_STATE_INTRO.next = MAIN_STATE_NORMAL
MAIN_STATE_INTRO.init = function() {
	main_items.foreach_all(function(child) {
		with child
			mode = MENU_STATES.INTRO
	})
}
MAIN_STATE_INTRO.callback = function() {
	global.main_menu.main_items.foreach_all(function(child) {
		with child
			mode = MENU_STATES.INTRO_END
	})
}

MAIN_STATE_FADEOUT_DONE = new menu_state()
MAIN_STATE_FADEOUT_DONE.period = 1.5
MAIN_STATE_FADEOUT_DONE.update = function() {
	check_menu_inputs()
}

MAIN_STATE_FADEOUT = new menu_state()
MAIN_STATE_FADEOUT.period = 2.1
MAIN_STATE_FADEOUT.next = MAIN_STATE_FADEOUT_DONE

MAIN_STATE_FADEIN = new menu_state()
MAIN_STATE_FADEIN.period = 1.2
MAIN_STATE_FADEIN.next = MAIN_STATE_NORMAL

MAIN_STATE_EXIT = new menu_state()
MAIN_STATE_EXIT.period = 1.6
MAIN_STATE_EXIT.callback = function() {
	game_end()
}

mode = null
mode_ratio = 0

menu_mode_change(MAIN_STATE_INTRO)
