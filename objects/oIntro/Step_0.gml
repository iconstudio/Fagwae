/// @description Updating

if dmode == 0 {
	if lean == 0 {
		if dtime++ < timed {
			dalpha += (1 - dalpha) * 0.2
			
			if mouse_check_button(mb_left) or keyboard_check_pressed(vk_enter)
				or io_check_pressed_padY() or io_check_pressed_padA()
				or io_check_pressed_padX() or io_check_pressed_padB() {
				dalpha = 1
				dtime = timed
			}
		} else {
			dalpha = 1
			dtime = timed
			lean = 1
		}
	} else { // lean == 1
		if dalpha > 0.01 {
			dalpha -= dalpha * 0.1
		} else {
			dalpha = 0
			dtime = 0
			dmode = 1 /*
			if progress == 0 {
				progress = 1
				lean = 0
			} else if progress == 1 {
				dmode = 1
			}*/
		}
	}
} else {
	if rpush > 0.01 {
		rpush -= rpush * 0.1
	} else {
		room_goto_next()
		exit
	}
}
