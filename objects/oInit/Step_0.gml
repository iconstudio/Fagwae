if dmode == 0 {
	if dalpha < 1 {
		dalpha += 0.04
	} else {
		dalpha = 1
	}
	exit
} else { // dmode == 1
	if dalpha > -2 {
		if mouse_check_button(mb_left) or keyboard_check_pressed(vk_anykey)
		or io_check_pressed_padAny() {
			dalpha = -2
		}

		dalpha -= 0.03
	} else {
		instance_destroy()
		if global.flag_is_mobile {
			instance_create_layer(0, 0, "UI", oMainIntro)
			exit
		}
		instance_create_layer(0, 0, "UI", oProfileEntry)
	}
}
