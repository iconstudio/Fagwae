/// @description Create enemies

entrance_x++
if entrance_y < screen_height + 40 // on gui
	entrance_y += entrance_vspeed

if back_mode == 0 {
	if y < 0 // on gui
		y += entrance_vspeed
	else
		y = 0
} else {
	if y < 0 // on gui
		y += entrance_vspeed
	else
		y = 0	
}

for (var i = 0; i < prohibit_count; ++i) {
	if instance_exists(prohibit_push[i])
		exit
}

if trigger_counter-- <= 0 {
	if trigger_size > 0 {
		trigger_datalast = ds_queue_dequeue(trigger_push)
		var type = trigger_datalast[0]
		var time = trigger_datalast[1]
		var data = trigger_datalast[2]
		var dother = trigger_datalast[3]
		var cx = trigger_datalast[4]
		var cy = trigger_datalast[5]
		
		switch type {
		case areapush_object:
			instance_last = instance_create_layer(cx, cy, "Instances", data)
			instance_last.type_create = dother
			with (instance_last)
				event_user(1)
			break

		case areapush_message:
			//flashstring_popup(data, cx, cy)
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
		trigger_size = ds_queue_size(trigger_push)
	}
}
