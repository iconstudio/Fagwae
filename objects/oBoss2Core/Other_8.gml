if path_last == pathBoss2_0 { // pattern 0, 1
	pattern = 2
	pattern_opened = false
	shot_count = 0
} else if path_last == pathBoss2_1 { // pattern 2
	var target_count = 2
	if hp <= hp_max * 0.333
		target_count = 3

	if ++pattern02_count >= target_count {
		path_end()

		pattern = 3
		pattern_opened = false
		pattern02_count = 0
		with glove_left {
			pattern = 3
			pattern_opened = false
		}
		with glove_right {
			pattern = 3
			pattern_opened = false
		}
	}
} else if path_last == pathBoss2_2 { // pattern 5
	var target_count = 2
	if hp <= hp_max * 0.2
		target_count = 3

	if ++pattern05_tempo >= target_count and pattern05_count > 400 {
		path_end()

		pattern = 2
		pattern_opened = false
		pattern05_count = 0
		pattern05_tempo = 0
		
		with glove_left {
			pattern = 2
			pattern_opened = false
		}
		with glove_right {
			pattern = 2
			pattern_opened = false
		}
	}
}

show_debug_message(path_get_name(path_last) + " ended now.")
