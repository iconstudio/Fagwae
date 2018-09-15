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

	title_push = 1 - push[0]
	for (var i = 0; i < 3; ++i) {
		push[i] = min(1, push[i] + reversing * 0.0162)
	}
	exit
}

if intro {
	if intro_mode == 0 {
		if intro_push[0] < 1 {
			intro_push[0] += 0.03
		} else {
			intro_push[0] = 1
			intro_mode = 1
		}
	} else if intro_mode == 1 {
		if intro_frame++ > 5 {
			if intro_push[1] != 1
				intro_push[1] += (1 - intro_push[1]) * 0.142857

			if intro_frame > seconds(0.5) and intro_push[1] > 0.6 {
				if title_push != 1
					title_push += (1 - title_push) * 0.1666

				if intro_projscale > 1.04 {
					intro_projscale += (1 - intro_projscale) * 0.333
				} else {
					intro_frame = 0
					intro_projscale = 1
					intro_mode = 2
				}
			}
			if intro_push[1] > 0.988 {
				title_push = 1
				intro_push[1] = 1
			}
		}
	} else if intro_mode == 2 {
		if intro_push[2] < 1 {
			intro_push[2] += 0.1
		} else {
			intro = false
			intro_frame = 0
			title_push = 1
		}
	}

	exit
}

for (var i = 0; i < 3; ++i) {
	if frame > i * 15 + 12 and push[i] != 0 {
		if push[i] != 0
			push[i] -= push[i] * 0.125
		else if !intro_clear
			intro_clear = true
		if intro_mode == 0
			title_push = 1 - push[0]

		if push[i] < 0.1 {
			if flash[i]++ > 15
				push[i] = 0
		}
	}
}
frame++

if frame < reversing_time or push[2] > 0.3
	exit


