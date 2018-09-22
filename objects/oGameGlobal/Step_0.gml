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

		capture = sprite_create_from_surface(application_surface, 0, 0, view_width, view_height, false, false, 0, 0)
	}

	global.screenlock = true
	instance_deactivate_all(true)
	instance_activate_object(oIgnore)
	instance_activate_object(oUIComponent)
} else if global.pause_counter <= 0 and global.screenlock {
	global.pause_counter = 0
	global.screenlock = false
	instance_activate_all()

	with oGlobal {
		surface_set_target(surf)
		draw_sprite(capture, 0, 0, 0)
		draw_surface_ext(application_surface, 0, 0, 1, 1, 0, $ffffff, 1)
		surface_reset_target()
	}
}

if global.screenlock {
	if fade_alpha < 1
		fade_alpha += 0.1
	else
		fade_alpha = 1
} else {
	if fade_alpha > 0
		fade_alpha -= 0.1
	else
		fade_alpha = 0
}

if global.screenlock
	exit

if global.screenshadowy > 0 {
	shadow_alpha += (1 - shadow_alpha) * 0.333

	global.screenshadowy -= global.screenshadowy * 0.5

} else if shadow_alpha != 0 {
	shadow_alpha -= shadow_alpha * 0.25
}

if player_counter > 0 {
	player_counter--
} else {
	if player_counter == 0 {
		player_counter = -1
		event_user(0)
	}
}

if instance_exists(oPlayerParent) {
	ipush -= ipush / 7
} else {
	if ipush < 1
		ipush += 0.004 + ipush * 0.1
	else
		ipush = 1
}

gaugetexy += 0.5
if gaugetexy >= 8
	gaugetexy -= 8

if global.gauge_count > 0
	global.gauge_count--
else if global.gauge_alpha != 0
	global.gauge_alpha -= global.gauge_alpha / 6

if global.gauge_alpha < 0.01 {
	global.gauge_alpha = 0
	global.gauge_target = noone
}

gaugerots = (gaugerots + 3) mod 360

global.player_fever_laser = max(0, min(100, global.player_fever_laser))
global.player_fever_shield = max(0, min(100, global.player_fever_shield))
