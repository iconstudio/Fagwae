/// @description 

if path_last == pathBoss2_0 {
	pattern = 2
	pattern_opened = false
	shot_count = 0
} else if path_last == pathBoss2_1 {
	var target_count = 2
	if hp <= hp_max * 0.333
		target_count = 3

	if ++pattern02_count >= target_count {
		path_end()

		pattern = 3
		pattern_opened = false
		pattern02_count = 0
	}
}

show_debug_message(path_get_name(path_last) + " ended now.")
