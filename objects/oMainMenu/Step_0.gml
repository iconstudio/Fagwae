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
			intro = false
			intro_frame = 0
			title_push = 1
		}
	}
	exit
} else {
	if !audio_is_playing(musicMainMenu)
		music_update(musicMainMenu)
}

for (var i = 0; i < 3; ++i) {
	if frame > i * 15 + 12 and push[i] != 0 {
		if push[i] != 0
			push[i] -= push[i] * 0.125
		if intro_mode == 0
			title_push = 1 - push[0]

		if push[i] < 0.1 {
			if flash[i]++ > 15
				push[i] = 0
		}
	}
}
if push[2] == 0 and !intro_clear
	intro_clear = true
frame++

if menu_current_lbx != menu_lbutton_x[menu_selected]
	menu_current_lbx += (menu_lbutton_x[menu_selected] - menu_current_lbx) * 0.2
if menu_current_rbx != menu_rbutton_x[menu_selected]
	menu_current_rbx += (menu_rbutton_x[menu_selected] - menu_current_rbx) * 0.2

if menu_scroll < 0.97
	menu_scroll += 0.03
else
	menu_scroll = 1

if frame < reversing_time or push[2] > 0.2 or instance_exists(oUIBlack) or instance_exists(oUIWindow)
	exit

var ckleft = io_check_left() or keyboard_check(vk_left) or keyboard_check(ord("A"))
var ckright = io_check_right() or keyboard_check(vk_right) or keyboard_check(ord("D"))
var pkleft = io_check_pressed_left() or keyboard_check_pressed(vk_left) or keyboard_check_pressed(ord("A"))
var pkright = io_check_pressed_right() or keyboard_check_pressed(vk_right) or keyboard_check_pressed(ord("D"))
var pkstart = keyboard_check_pressed(vk_space) or keyboard_check_pressed(vk_enter) or io_check_pressed_padA()

if true/*global.flag_is_mobile*/ {
	if device_mouse_check_button_pressed(0, mb_left) {
		var my = device_mouse_y(0)
		if my > menu_buttony - 50 and my < menu_buttony + 90 {
			var mx = device_mouse_x(0)
			if 10 < mx and mx < max(view_width * 0.5 - 110, menu_lbutton_x[menu_selected] + 20) {
				pkleft = true
			} else if min(view_width * 0.5 + 110, menu_rbutton_x[menu_selected] - 20) < mx and mx < view_width - 10 {
				pkright = true
			}
		}
	}
	if device_mouse_check_button_released(0, mb_left) {
		var my = device_mouse_y(0)
		if my > menu_buttony - 50 and my < menu_buttony + 90 {
			var mx = device_mouse_x(0)
			if view_width * 0.5 - 70 < mx and mx < view_width * 0.5 + 70
				pkstart = true
		}
	}
}

if pkstart and !keyboard_check_pressed(vk_backspace) {
	switch menu_selected {
		case 0:
			draw_mode = MODE_GAME
			break
		case 1:
			draw_mode = MODE_STATISTICS
			break
		case 2:
			draw_mode = MODE_ACHIEVEMENTS
			break
		case 3:
			draw_mode = MODE_EXIT
			break
		default:
			show_error("Invalid menu item!\n" + string(draw_mode), true)
			break
	}
}

if !pkstart {
	if menu_auto == 0 { // continuosly
		if pkleft xor pkright {
			menu_auto = seconds(0.6)

			menu_before = menu_selected
			menu_push = (pkright - pkleft)
			menu_selected += menu_push
			event_user(1)
		} else if ckleft xor ckright {
			menu_auto = seconds(0.3)

			menu_before = menu_selected
			menu_push = (ckright - ckleft)
			menu_selected += menu_push
			event_user(1)
		}
	}
}

if menu_auto > 0
	menu_auto--
else
	menu_auto = 0
