/// @description Update
if begin_y != y
	y += (begin_y - y) * 0.1

if draw_mode == 0 {
	alpha = fadein_time / fadein_limit
	if fadein_time++ >= fadein_period {
		draw_mode = 1
		time_current = 0
	}
} else {
	alpha = 1 - ease_out_expo(fadeout_time / fadeout_period)
	if fadeout_time++ >= fadeout_period {
		alpha = 0
		
		with callback {
			callto = other.id
			event_user(1)
		}
		instance_destroy()
	}
}
