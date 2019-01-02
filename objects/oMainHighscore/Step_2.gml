for (var i = 0; i < global.achievement_count; ++i) {
	var aclph = 0.5 + global.achievement_cleared[i] * 0.5
	if selected == i {
		alpha[i] += (aclph - alpha[i]) / 13
		angle[i] += (60 - angle[i]) * 0.1
	} else {
		alpha[i] -= alpha[i] / (aclph * 10 + 2)
		angle[i] -= angle[i] * 0.1
	}
}

scroll += (selected * scroll_gab - scroll) / 8
rots += 2
if rots > 360
	rots -= 360

if draw_mode == 0 {
	rfrm++
	for (var i = 0; i < 3; ++i) {
		if rfrm > i * 12 + 6
			rpush[i] -= rpush[i] * 0.25
	}
} else {
	if rfrm == 0 {
		for (var i = 0; i < 3; ++i)
			rpush[i] = 0
	}

	rfrm++
	for (var i = 0; i < 3; ++i) {
		if rfrm > i * 12 + 6
			rpush[i] += 0.006 + rpush[i] / 7
	}

	if rpush[2] > 1
		instance_destroy()
	exit
}

if (io_check_pressed_left() or io_check_pressed_up()) and current_time mod 1000 == 0 {
	if selected > 0
		selected -= 1
	else
		selected = global.achievement_count - 1
}

if io_check_pressed_right() or io_check_pressed_down() {
	if selected < global.achievement_count - 1
		selected += 1
	else
		selected = 0
}

if io_check_pressed_padA() or io_check_pressed_padB()
	event_perform(ev_keypress, vk_enter)
