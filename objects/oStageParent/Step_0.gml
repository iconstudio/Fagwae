/// @description Updating Background and Creating pushes
brightness = brightness_time / brightness_period
if brightness_time < brightness_period
	brightness_time++

if !global.playeralive
	exit

if prohibit_count > 0 {
	for (var i = 0; i < prohibit_count; ++i) {
		if instance_exists(prohibit_push[i]) {
			//show_debug_message(object_get_name(prohibit_push[i].object_index) + " is distracted.")
			exit
		}
	}
}

if flag_stop {
	trigger_size = 0
	trigger_pos = 0
	trigger_counter = 0
	exit
}

if flag_await_clear {
	if !instance_exists(oEnemyParent)
		flag_await_clear = false
	else
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
		case trigger.object:
			instance_last = instance_create_layer(cx, cy, "Instances", data)
			instance_last.type_create = dother
			break

		case trigger.enemy:
			if flag_boss {
				instance_last = enemy_create(data, cx, cy, dother, 0, noone, "Boss")
				flag_boss = false
				prohibit_push[prohibit_count++] = instance_last
			} else {
				instance_last = enemy_create(data, cx, cy, dother)
				if flag_await_die {
					prohibit_push[prohibit_count++] = instance_last
					flag_await_die = false
				}
			}
			break

		case trigger.message:
			show_flashstring(cx, cy, data, 0)
			break

		case trigger.script:
			script_execute(data, dother, cx, cy)
			break

		case trigger.global:
			instance_last = instance_create_layer(cx, cy, "Instances", data)
			break

		case trigger.userevent:
			event_user(data)
			break

		case trigger.music:
			music_update(data)
			break
			
		case trigger.delay:
			break
		}

		trigger_counter = time
	}
}
