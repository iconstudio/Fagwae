/// @description 

if dmode == 0 {
	if dalpha < 1 {
		dalpha += 0.04
	} else {
		dalpha = 1
	}
	exit
} else { // dmode == 1
	if dalpha > -2 {
		if mouse_check_button(mb_left) or keyboard_check_pressed(vk_enter)
		or io_check_pressed_padY() or io_check_pressed_padA()
		or io_check_pressed_padX() or io_check_pressed_padB() {
			dalpha = -2
		}

		dalpha -= 0.03
	} else {
		instance_destroy()
		if global.flag_is_mobile {
			instance_create_layer(0, 0, "UI", oIntro)
			exit
		}
		instance_create_layer(0, 0, "UI", oProfileEntry)
	}
}
