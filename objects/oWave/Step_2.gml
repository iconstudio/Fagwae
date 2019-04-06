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

/*size_newer += (size_target - size_newer) / (12 * adiv)
size_previous += (size_newer - size_previous) / (8 * adiv)
size_origin += (size_newer - size_origin) / (16 * adiv)
if abs(size_previous - size_target) < 1
	instance_destroy()
*/

event_user(0)
