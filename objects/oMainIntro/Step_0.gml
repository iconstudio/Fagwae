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
				music_update(musicMainMenu)
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
		intro_frame = 0
		title_push = 1
		instance_destroy()
	}
}
