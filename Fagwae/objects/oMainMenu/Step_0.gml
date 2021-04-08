/// @description Update
do_update_logic()

var zoom_ratio = zoom_time / zoom_period
if zoom_mode == 0 {
	zoom_x = lerp(zoom_sx, zoom_dx, zoom_ratio)
	zoom_y = lerp(zoom_sy, zoom_dy, zoom_ratio)
	zoom_w = lerp(zoom_sw, zoom_dw, zoom_ratio)
	zoom_h = lerp(zoom_sh, zoom_dh, zoom_ratio)

	if zoom_time < zoom_period {
		zoom_time += Delta
	} else {
		zoom_mode = -1
		zoom_time = 0
	}
} else if zoom_mode == 1 {
	
}

global.key_confirm.foreach_all(function(Key) {
	if keyboard_check_pressed(Key)
		event_user(5)
})

global.key_back.foreach_all(function(Key) {
	if keyboard_check_pressed(Key)
		event_user(6)
})
