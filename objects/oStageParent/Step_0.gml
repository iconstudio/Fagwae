/// @description Create pushes

entrance_x++
if entrance_y < screen_height + 40 // on gui
	entrance_y += entrance_vspeed

if back_mode == 0 {
	if y < 0 // to bottom of screen
		y += entrance_vspeed
	else
		y = 0
} else {
	if y < screen_height + 40 // to beyond of the screen
		y += entrance_vspeed
	else
		instance_destroy()
}

for (var i = 0; i < prohibit_count; ++i) {
	if instance_exists(prohibit_push[i])
		exit
}

if trigger_counter-- <= 0 {
	if trigger_size - trigger_pos > 0 {
		trigger_datalast = trigger_push[trigger_pos++]
		var type = trigger_datalast[0]
		var time = trigger_datalast[1]
		var data = trigger_datalast[2]
		var dother = trigger_datalast[3]
		var cx = trigger_datalast[4]
		var cy = trigger_datalast[5]
		show_debug_message("Time: " + string(time) + ", Type: " + string(type) + ", Data: " + string(data))
		show_debug_message("Other: " + string(dother) + ", x: " + string(cx) + ", y: " + string(cy))
		
		switch type {
		case areapush_object:
			instance_last = instance_create_layer(cx, cy, "Instances", data)
			instance_last.type_create = dother
			break

		case areapush_enemy:
			instance_last = enemy_create(data, cx, cy, dother)
			with instance_last
				event_user(1)
			break

		case areapush_message:
			show_flashstring(cx, cy, data, 0)
			break

		case areapush_script:
			script_execute(data, dother, cx, cy)
			break

		case areapush_global:
			instance_last = instance_create_layer(cx, cy, "Instances", data)
			break
			
		case areapush_delay:
			break
		}

		trigger_counter = time
	}
}
