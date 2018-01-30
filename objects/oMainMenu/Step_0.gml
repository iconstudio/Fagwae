/// @description 

for (var i = 0; i <= maxdepth; ++i) {
	menupos[i] += (-13 * menusel[i] - menupos[i]) / 5
	menuscl[i] -= menuscl[i] / 5
	if menuinf[i, menusel[i]] != ""
		infoscl[i] += (1 - infoscl[i]) / 5
	else
		infoscl[i] -= infoscl[i] / 5

	if menuinf[i, menuold[i]] != ""
		infosco[i] -= infosco[i] / 5
}

if menudepth != menuldepth {
	menuppdepth = menupdepth
	menupdepth = menuldepth
	if menuppdepth = menudepth
		menuscr = 1 - menuscr
	else
		menuscr = 0;
	menuldepth = menudepth
}

if menuscr < 0.97
 menuscr += 0.03
else
 menuscr = 1
menurot = catmull_rom_spline(menuscr, menudepth, menupdepth, menudepth, menupdepth) * 90

if draw_mode > 0 {
	rfrm = 0
	if sgrv++ > 20 {
		switch draw_mode {
			case 1:
				instance_create_layer(0, 0, "Submenu", oMainHighscore)
				draw_mode = 4
				break
			case 5:
				instance_create_layer(0, 0, "Submenu", oMainAchievement)
				draw_mode = 4
				break
			case 6:
				instance_create_layer(0, 0, "Backend", oProfileResetter)
				draw_mode = 4
				break
		}
	}

	if sgrv > 55 {
		if draw_mode == 2 {
			instance_destroy()
			room_goto_next()
		} else if draw_mode == 3 {
			game_end()
		}
	}

	for (var i = 0; i < 3; ++i)
		rpush[i] += sgrv / 4
	exit
}

if !menu_outta() {
	if io_check_pressed_left() or io_check_pressed_up() {
		autostop = true
		menu_change_up(menudepth)
	}
	
	if io_check_pressed_right() or io_check_pressed_down() {
		autostop = true
		menu_change_down(menudepth)
	}
	
	if io_check_pressed_padA()
		event_perform(ev_keypress, vk_enter)

	if io_check_pressed_padB()
		event_perform(ev_keypress, vk_escape)
}

rfrm++
for (var i = 0; i < 3; ++i) {
	if rfrm > i * 10 + 12 && rpush[i] != 0 {
		rpush[i] -= rpush[i] / 4
		if rpush[i] < 8 {
			if rflash[i]++ > 15
				rpush[i] = 0
		}
	}
}
