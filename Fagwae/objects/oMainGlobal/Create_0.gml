global.main_menu = id
global.main_surface = -1

event_user(0)

lyr_interface = layer_get_id("interface")
main_items = new List()
main_start = instance_create_layer(441, 492, lyr_interface, oMainStart)
main_start.parent = id
main_trophy = null
main_setting = null
main_exit = instance_create_layer(640, 960, lyr_interface, oMainExit)
main_exit.parent = id

main_items.push_back(main_start)
main_items.push_back(main_exit)

child_choice = null
child_focus = main_start
/*
layer_script_begin(lyr_interface, function() {
	if event_type == ev_draw {
		if event_number == 0 { 
			if !surface_exists(global.main_surface) {
				global.main_surface = surface_create(SCREEN_W, SCREEN_H)
			}

			surface_set_target(global.main_surface)
			draw_clear_alpha(0, 1)
		}
	}
})

layer_script_end(lyr_interface, function() {
	if event_type == ev_draw {
		if event_number == 0 { 
			surface_reset_target()
		}
	}
})
*/
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

draw_set_color($ffffff)
draw_set_font(fontMainMenuEntry)

menu_mode_change(MAIN_STATE_INTRO)
