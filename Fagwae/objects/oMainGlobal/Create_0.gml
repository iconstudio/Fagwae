main_items = new List()

main_start = instance_create_layer(441, 492, "interface", oMainStart)
main_start.parent = id
main_trophy = null
main_setting = null
main_exit = null
main_items.push_back(main_start)

child_focus = main_start
child_choice = null

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
	duration_long: 1
}

draw_set_color($ffffff)
draw_set_font(fontMainMenuEntry)

event_user(0)

global.main_menu = id

function key_repeat(key) {
	if is_null(key) {
		repetive.key = null
		repetive.time = 0
		return false
	}

	if repetive.key != key {
		repetive.key = key
		repetive.time = duration_long
		return true
	}
	return false
}
