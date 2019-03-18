if draw_mode == 0 {
	if appear_time < appear_period {
		appear_time++
	} else {
		for (var i = 0; i < global.achievement_count; ++i) {
			if item_show_time > i * item_show_gap_period {
				if item_time[i] < item_period
					item_time[i]++
			}
		}
		item_show_time++
	}
} else {
	if disappear_time < disappear_period {
		disappear_time++
	} else {
		audio_play_sound(soundMenuBack, 5, false)
		with oMainMenu
			event_user(0)
		instance_destroy()
	}
	exit
}

if appear_time < appear_period
	exit

var kleft = keyboard_check(vk_left) or keyboard_check(vk_up) or io_check_left() or io_check_up()
var kright = keyboard_check(vk_right) or keyboard_check(vk_down) or io_check_right() or io_check_down()
var kcheck = kright - kleft
if kcheck == -1 {
	if scroll > 14
		scroll -= 14
	else
		scroll = 0
} else if kcheck == 1 {
	if scroll < content_height - viewer_height - 14
		scroll += 14
	else
		scroll = content_height - viewer_height
}

// go to the main menu
var kenter = keyboard_check(vk_enter) or keyboard_check(vk_backspace)
or keyboard_check(vk_escape) or keyboard_check(vk_space) or keyboard_check(ord("X"))
or io_check_pressed_padA() or io_check_pressed_padB()
if kenter {
	if draw_mode == 0 and appear_time == appear_period {
		draw_mode = 1

	}
}
