/// @description Enter

global._debugsett_ = 0;

if keyboard_check(vk_shift)
	global._debugsett_ = true

if profile_load(global.profilefile) {
	instance_destroy()
	exit
} else {
	profile_clear()
	show_debug_message("Cannot load profile.")
}

kstring = ""

lastkey = -1
dmode = 0
dalpha = 1
