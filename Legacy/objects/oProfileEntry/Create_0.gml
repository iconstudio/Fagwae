/// @description Enter
kstring = ""

dmode = 0
dalpha = 1

if global.flag_is_pc and keyboard_check_direct(vk_shift) {
	global.__cheat_invincible = true
	global.__cheat_powerful = true
	global.__cheat_inf_bombs = true
}

if global.flag_is_mobile {
	keyboard_virtual_show(kbv_type_phone_name, kbv_returnkey_go, kbv_autocapitalize_none, false)
}

if profile_load(global.profilefile) {
	dalpha = 0
	alarm[1] = 1
	exit
} else {
	show_debug_message("Cannot load the profile.")
}
