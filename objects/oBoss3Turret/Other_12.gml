/// @description Update
var player_direction = point_direction(x, y, global.px, global.py)
if pattern == 3 {
	var shot_direction_sign = lengthdir_x(20, pattern03_angle + pattern03_angular_time / pattern03_angular_period * 360)
	shot_direction_target = player_direction + shot_direction_sign
} else {
	shot_direction_target = player_direction
}
if shot_direction != shot_direction_target
	shot_direction += get_rotation_next(shot_direction, shot_direction_target, 0.3)
shot_lx = x + lengthdir_x(22, shot_direction)
shot_ly = y + lengthdir_y(22, shot_direction)

if pattern == 0 {
	if pattern00_shot_count < 5 {
		if pattern00_shot_time < pattern00_shot_period {
			pattern00_shot_time++
		} else {
			pattern00_shot_time = 0

			var shot_size = pattern00_shot_list[pattern00_shot_count]
			var shot_angle = pattern00_shot_angle_list[pattern00_shot_count]
			var shot_direction_begin = shot_direction - (shot_size - 1) * shot_angle * 0.5
			for (var i = 0; i < shot_size; ++i)
				enemy_shot(shot_lx, shot_ly, shot_speed, shot_direction_begin + shot_angle * i)
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
				for (var i = 0; i < shot_size; ++i)
					enemy_shot(shot_lx, shot_ly, shot_speed, shot_direction_begin + shot_angle * i)
				if !audio_is_playing(soundShotEnemy)
					enemy_play_shot()

				pattern00_shot_second_count++
			}
		}
	}
} else if pattern == 1 {
	if pattern01_shot_count < 4 {
		if pattern01_shot_time < pattern01_shot_period {
			pattern01_shot_time++
		} else {
			var shot_size = pattern01_shot_list[pattern01_shot_count]
			if 0 < shot_size {
				var shot_angle = pattern01_shot_angle_list[pattern01_shot_count]
				var shot_direction_begin = shot_direction - (shot_size - 1) * shot_angle * 0.5
				for (var i = 0; i < shot_size; ++i)
					enemy_shot(shot_lx, shot_ly, pattern01_shot_speed, shot_direction_begin + shot_angle * i)
				if !audio_is_playing(soundShotEnemy)
					enemy_play_shot()
			}

			pattern01_shot_time = 0
			pattern01_shot_count++
		}
	}
} else if pattern == 3 {
	if pattern03_start_time < pattern03_start_period {
		pattern03_start_time++
	} else if oBoss3Core.pattern03_time < oBoss3Core.pattern03_period * 0.8 {
		if pattern03_angular_time < pattern03_angular_period
			pattern03_angular_time++
		else
			pattern03_angular_time = 0

		if pattern03_shot_time < pattern03_shot_period {
			pattern03_shot_time++
		} else {
			var shot_direction_gab = global.extreme ? 15 : 8
			enemy_shot(shot_lx, shot_ly, pattern03_shot_speed, shot_direction - shot_direction_gab)
			enemy_shot(shot_lx, shot_ly, pattern03_shot_speed, shot_direction + shot_direction_gab)
			if !audio_is_playing(soundShotEnemy)
				enemy_play_shot()

			pattern03_shot_time = 0
		}
	}
} else if pattern == 4 {
	if pattern04_shot_time < pattern04_shot_period {
		pattern04_shot_time++
	} else {
		enemy_shot(shot_lx, shot_ly, pattern04_shot_speed, shot_direction - 18)
		enemy_shot(shot_lx, shot_ly, pattern04_shot_speed, shot_direction + 18)
		if !audio_is_playing(soundShotEnemy)
			enemy_play_shot()

		pattern04_shot_time = 0
	}
}

if parent.pattern != pattern {
	pattern03_start_time = 0
	pattern03_angle = random(360)
	pattern03_angular_time = 0
	pattern04_shot_time = 0

	pattern = parent.pattern
	pattern_opened = false
}

damaged = parent.damaged
