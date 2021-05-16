/// @description Update
var wave_ratio = time / period
size_newer = size_target * 0.1 + size_newer_gap * ease.out_quart(wave_ratio)
size_previous = size_newer * ease.out_circ(wave_ratio)
size_origin = size_newer * (wave_ratio)


if time < period {
	event_user(0)
	time += Delta
} else {
	instance_destroy()
}
