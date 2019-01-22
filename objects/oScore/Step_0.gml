if instance_exists(oPlayer) {
	if score_show_time < score_show_period
		score_show_time++
} else {
	if score_show_time > 0
		score_show_time--
	else
		score_show_time = 0
}

score_gap = (global.playerscore - score_virtual)
if score_increase_time < score_increase_period {
	score_virtual = score_previous + score_gap * (score_increase_time / score_increase_period)
	score_increase_period++
} else {
	score_previous = global.playerscore
	score_virtual = global.playerscore
}

if score_gap != 0
	score_wave -= min(score_wave + max(0, score_gap * 0.333) * 0.1, 7) / 7
else
	score_wave -= min(score_wave, 7) / 7

if score_rotate_time < score_rotate_period {
	score_rotation = score_rotate_time++ / score_rotate_period * 360
} else {
	score_rotation = 0
	score_rotate_time = 0
}

//score_rotation = (score_rotation + 5) mod 360
