/// @description Initialization

menu_camera = camera_create_view(0, 0, 450, 800, 0, noone, 0, 0, -1, -1)

if global.achievement_count <= 0
	show_debug_message("There is no achievement!")

draw_mode = 0
rfrm = 0
scroll = 0
scroll_gab = -132
rots = 0
for (var i = 0; i < 3; ++i)
	rpush[i] = 1

for (var i = 0; i < global.achievement_count; ++i) {
	archx[i] = i * -scroll_gab - 20
	angle[i] = 0
	alpha[i] = 0
}

selected = 0
lastkey = -1
autostop = false
