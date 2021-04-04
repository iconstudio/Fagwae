/// @description Initialization
border = 20
width_interpolated = 450 + border * 2
height_interpolated = 800 + border * 2
fullwidth_interpolated = room_width + border * 2
fullheight_interpolated = room_height + border * 2

size_target = 120
size_newer = 12
size_newer_gap = size_target - size_newer
size_previous = 0
size_origin = size_target * 2
wave_time = 0
wave_period = seconds(1)

wave_vertexes = 24
wave_vertexes_less = wave_vertexes - 1
image_angle = random(360)
var wave_angle, wave_between = 360 / wave_vertexes
for (var i = 0; i < wave_vertexes; ++i) {
	wave_angle = image_angle + wave_between * i
	wave_lengthx[i] = lengthdir_x(1, wave_angle)
	wave_lengthy[i] = lengthdir_y(1, wave_angle)
}

event_user(0)
