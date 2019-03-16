/// @description Update
event_user(2)

if !window_has_focus() and !global.screenlock
	game_pause()

if io_check_pressed_start()
	event_perform(ev_keypress, ord("P"))

if global.pause_counter > 0 and !global.screenlock {
	with oGlobal {
		if sprite_exists(capture)
			sprite_delete(capture)
		capture = sprite_create_from_surface(application_surface, 0, 0, room_width, room_height, false, false, 0, 0)
	}

	global.screenlock = true
	instance_deactivate_all(true)
	instance_activate_object(oIgnore)
} else if global.pause_counter <= 0 and global.screenlock {
	global.pause_counter = 0
	global.screenlock = false
	instance_activate_all()
}

if global.screenlock {
	if pause_alpha < 1
		pause_alpha += 0.1
	else
		pause_alpha = 1
	exit
} else {
	if pause_alpha > 0
		pause_alpha -= 0.1
	else
		pause_alpha = 0
}

if shadow_time > 0 {
	shadow_alpha = ease_out_quintic(shadow_time / shadow_period)
	shadow_time--
} else {
	shadow_alpha = 0
}

if player_appear_time > 0 {
	player_appear_time--
} else {
	if player_appear_time == 0 {
		player_appear_time = -1
		event_user(0)
	}
}

if !instance_exists(oPlayerParent) {
	if ui_appear_time > 0
		ui_appear_time--
} else {
	if ui_appear_time < ui_appear_period
		ui_appear_time++
	else
		ui_appear_time = ui_appear_period
}
if ui_appear_time > 0
	ui_alpha = ease_in_out_back(ui_appear_time / ui_appear_period)
else
	ui_alpha = 1

if gauge_time > 0 {
	gauge_time--
	gauge_alpha = 1
} else {
	if gauge_show_time > 0
		gauge_alpha = ease_out_expo(gauge_show_time-- / gauge_show_period)
	else
		gauge_alpha = 0
}
gauge_texloop_y = gauge_texloop_time / gauge_texloop_period * gauge_texloop_y_max
if ++gauge_texloop_time > gauge_texloop_period
	gauge_texloop_time = 0
gauge_rots = (gauge_rots + 3) mod 360

global.player_fever_laser = max(0, min(100, global.player_fever_laser))
global.player_fever_shield = max(0, min(100, global.player_fever_shield))
