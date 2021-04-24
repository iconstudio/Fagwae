Menu()

caption = "Main Menu"
global.main_menu = id
global.main_surface = -1

event_user(0)

main_start = null //add_main_entry(oMainStart, 441, 492)
main_trophy = null
main_setting = null
main_exit = null//add_main_entry(oMainExit, 640, 960)

//focus_child(main_start)

arrow_current = NONE
arrow_hr_key_anchor = 0
arrow_vt_key_anchor = 0

io_r_left = false
io_r_right = false
io_r_up = false
io_r_down = false


repetive = {
	key: null,
	time: 0,
	duration_short: 0.13,
	duration_long: 1,

	stop: function() {
		key = null
		time = 0
	}
}


function key_repeat(key) {
	if is_null(key) {
		repetive.stop()
		return false
	}

	if repetive.key != key {
		repetive.key = key
		repetive.time = repetive.duration_long
		return true
	}
	return false
}


draw_set_color($ffffff)
draw_set_font(fontMainMenuEntry)

Astate_goto(main_state_intro)
