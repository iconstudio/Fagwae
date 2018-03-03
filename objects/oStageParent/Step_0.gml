/// @description Updating Background and Creating pushes

if !available
	exit

if back_mode == 0 {
	if image_alpha < 1
		image_alpha += 0.08
	else
		image_alpha = 1
} else {
	if image_alpha > 0
		image_alpha -= 0.08
	else
		instance_destroy()
}

if instance_exists(oPlayer) and back_mode == 0 {
	if score_alpha < 1
		score_alpha += 0.01
	else
		score_alpha = 1
} else {
	if score_alpha > 0
		score_alpha -= 0.01
	else
		score_alpha = 0
}

if brightness < 1
	brightness += 0.014
else
	brightness = 1

var ascore = (score - global.vscore) / 3
global.vscore += ascore

score_wave -= min(score_wave + max(0, ascore) / 10, 7) / 7
score_rotation = (score_rotation + 5) mod 360

if prohibit_count > 0 {
	for (var i = 0; i < prohibit_count; ++i) {
		if instance_exists(prohibit_push[i])
			exit
	}
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
			if flag_boss {
				instance_last = enemy_create(data, cx, cy, dother, 0, noone, "Boss")
				flag_boss = false
			} else {
				instance_last = enemy_create(data, cx, cy, dother)
			}
			prohibit_push[prohibit_count++] = instance_last
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
