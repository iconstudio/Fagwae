if draw_mode > 0 {
	frame = 0
	if reversing++ > reversing_time {
		switch draw_mode {
			case MODE_STATISTICS:
				instance_create_layer(0, 0, layer, oMainHighscore)
				draw_mode = MODE_FADEOUT
				break

			case MODE_ACHIEVEMENTS:
				if global.flag_is_mobile { // open Game Center or Google Play
					
					draw_mode = 0
				} else {
					instance_create_layer(0, 0, layer, oMainAchievement)
					draw_mode = MODE_FADEOUT
				}
				break

			case MODE_RESET:
				instance_create_layer(0, 0, layer, oProfileResetter)
				draw_mode = MODE_FADEOUT
				break
		}
	}

	if reversing > reversing_time * 2 {
		if draw_mode == MODE_GAME {
			instance_destroy()
			room_goto_next()
		} else if draw_mode == MODE_EXIT {
			game_end()
		}
	}

	for (var i = 0; i < 3; ++i) {
		push[i] = min(1, push[i] + reversing * 0.0162)
	}
	exit
}

for (var i = 0; i < 3; ++i) {
	if frame > i * 15 + 12 and push[i] != 0 {
		if push[i] != 0
			push[i] -= push[i] * 0.25

		if push[i] < 0.1 {
			if flash[i]++ > 15
				push[i] = 0
		}
	}
}
frame++

if frame < reversing_time or push[2] > 0.3
	exit


