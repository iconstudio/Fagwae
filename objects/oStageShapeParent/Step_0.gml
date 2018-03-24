/// @description Destroying decorations

if deco_mode == 1 {
	if !deco_fail {
		alarm[4] = 5
		alarm[5] = 50

		deco_fail = true
	}
}

event_inherited()