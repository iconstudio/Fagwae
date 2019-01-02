/// @description Auto repeating the last pressed key
if keyboard_check(lastkey) and !autostop {
	event_perform(ev_keypress, lastkey)
	alarm[0] = seconds(0.05)
} else {
	autostop = false
}
