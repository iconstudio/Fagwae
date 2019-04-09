/// @description Enter
kstring = ""

dmode = 0
dalpha = 1

global._debugsett_ = 0;

if keyboard_check_direct(vk_shift)
	global._debugsett_ = true

if profile_load(global.profilefile) {
	dalpha = 0
	alarm[1] = 1
	exit
} else {
	show_debug_message("Cannot load the profile.")
}
