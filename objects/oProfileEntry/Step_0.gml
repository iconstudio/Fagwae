/// @description Enter the name of profile

if dmode {
	if dalpha > -1 
		dalpha -= 0.01
	else
		room_goto_next()
	exit
}

var len = string_length(keyboard_string)
for (var i = 0; i < len; ++i) {
	alarm[0] = -1
	dchr = ord(string_char_at(keyboard_string, i + 1))
	if dchr > 96 and dchr < 123
		dchr -= 32

	if char_check(dchr) {
		if string_length(kstring) < 16
			kstring += chr(dchr)
	}
}

keyboard_string = ""
