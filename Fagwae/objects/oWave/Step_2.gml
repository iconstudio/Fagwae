/// @description Update
var wave_ratio = wave_time / wave_period
size_newer = size_target * 0.1 + size_newer_gap * ease_out_cubic(wave_ratio)
size_previous = size_newer * ease_out_quad(wave_ratio)
size_origin = size_newer * (wave_ratio)

if wave_time < wave_period {
	wave_time++
} else {
	instance_destroy()
	exit
}

event_user(0)
