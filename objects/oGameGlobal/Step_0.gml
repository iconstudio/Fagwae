/// @description Update

event_user(2)

if !window_has_focus() and !global.screenlock and !global.paused
	game_pause()

if global.screenlock or global.paused
	exit

if io_check_pressed_start() or io_check_pressed_select()
	event_perform(ev_keypress, ord("P"))

if global.screenshadowy > 0 {
	shadow_alpha += (1 - shadow_alpha) / 3

	global.screenshadowy -= global.screenshadowy / 2

} else if shadow_alpha != 0 {
	shadow_alpha -= shadow_alpha / 4
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
		ipush += 0.004 + ipush / 10
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
