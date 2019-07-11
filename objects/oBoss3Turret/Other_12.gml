/// @description Update
shot_direction = point_direction(x, y, global.px, global.py)

if pattern == 0 {
	if pattern00_shot_count < 5 {
		if pattern00_shot_time < pattern00_shot_period {
			pattern00_shot_time++
		} else {
			pattern00_shot_time = 0

			var shot_size = pattern00_shot_list[pattern00_shot_count]
			var shot_angle = pattern00_shot_angle_list[pattern00_shot_count]
			var shot_direction_begin = shot_direction - (shot_size - 1) * shot_angle * 0.5
			for (var i = 0; i < shot_size; ++i) {
				var inst = enemy_shot(x + lengthdir_x(22, shot_direction), y + lengthdir_y(22, shot_direction), shot_speed, shot_direction_begin + shot_angle * i)
				inst.parent = parent
				inst.hspeed += parent.hspeed
				inst.vspeed += parent.vspeed
			}

			if !audio_is_playing(soundShotEnemy)
				enemy_play_shot()

			pattern00_shot_count++
		}
	} else {
		if !pattern_opened {
			pattern_opened = true

			pattern00_shot_time = -seconds(2) // will shots after 2 seconds
		} else if pattern00_shot_second_count < 3 {
			if pattern00_shot_time < pattern00_shot_period {
				pattern00_shot_time++
			} else {
				pattern00_shot_time = 0
				
				var shot_size = pattern00_shot_second_list[pattern00_shot_second_count]
				var shot_angle = 9
				var shot_direction_begin = shot_direction - shot_size * shot_angle * 0.5
				for (var i = 0; i < shot_size; ++i) {
					var inst = enemy_shot(x + lengthdir_x(22, shot_direction), y + lengthdir_y(22, shot_direction), shot_speed, shot_direction_begin + shot_angle * i)
					inst.parent = parent
					inst.hspeed += parent.hspeed
					inst.vspeed += parent.vspeed
				}

				if !audio_is_playing(soundShotEnemy)
					enemy_play_shot()

				pattern00_shot_second_count++
			}
		}
	}
} else if pattern == 1 {
	
}

if parent.pattern != pattern {
	pattern = parent.pattern
	pattern_opened = false
}

damaged = parent.damaged
