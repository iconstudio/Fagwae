/// @description Starting destroying decorations
event_inherited()

if deco_mode == 1 {
	if !deco_fail {
		alarm[5] = deco_fail_period * 2

		deco_fail = true
	}
}
