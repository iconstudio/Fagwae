/// @description Update
if pattern == 0 and 40 < bbox_top {
	if pattern00_shot_time < pattern00_shot_period {
		pattern00_shot_time++
	} else {
		if oBoss3Core.pattern00_time <= 1 { // for a interval
			enemy_shot(x, y - 9, pattern00_shot_speed, 264)
			enemy_shot(x, y - 9, pattern00_shot_speed, 277)
			if global.extreme
				enemy_shot(x, y - 9, pattern00_shot_speed, 270)
			var efx_number_kill = global.extreme ? 3 : 2
			var efx_number_last = instance_number(oEnemyBulletCreate) - efx_number_kill
			repeat efx_number_kill
				instance_destroy(instance_find(oEnemyBulletCreate, efx_number_last))
			enemy_shot(x, y + 2, pattern00_shot_speed, 264)
			enemy_shot(x, y + 2, pattern00_shot_speed, 277)
			if global.extreme
				enemy_shot(x, y + 2, pattern00_shot_speed, 270)
			if !audio_is_playing(soundShotEnemy)
				enemy_play_shot()

			pattern00_shot_time = 0
		}
	}
} else if pattern == 1 {
	var pinching_ratio = ease_in_out_cubic(oBoss3Core.pattern01_pinching_time / oBoss3Core.pattern01_pinching_period)

	if pinching_ratio <= 0.2 {
		if pattern01_shot1_time < pattern01_shot1_period {
			pattern01_shot1_time++
		} else {
			enemy_shot(x, y, pattern01_shot1_speed, 270)
			if global.extreme
				enemy_shot(x, y, pattern01_shot1_green_speed, mean(270, image_angle), oEnemyBullet2)
			enemy_play_shot()

			pattern01_shot1_time = 0
		}
	} else if pinching_ratio < 1 {
		if !pattern_opened {
			enemy_shot(x, y, pattern01_shot2_snipe_speed, point_direction(x, y, global.px, global.py))
			enemy_play_shot()
			pattern_opened = true
		}

		if pattern01_shot2_time < pattern01_shot2_period {
			pattern01_shot2_time++
		} else {
			if parent.type_create == LEFT {
				enemy_shot(x, y, pattern01_shot2_speed, image_angle - 10)
				enemy_shot(x, y, pattern01_shot2_speed, image_angle + 6)

				if global.extreme
					enemy_shot(x, y, pattern01_shot2_speed, image_angle - 40)
			} else {
				enemy_shot(x, y, pattern01_shot2_speed, image_angle + 10)
				enemy_shot(x, y, pattern01_shot2_speed, image_angle - 6)

				if global.extreme
					enemy_shot(x, y, pattern01_shot2_speed, image_angle + 40)
			}
			if global.extreme
				enemy_shot(x, y, pattern01_shot2_green_speed, image_angle, oEnemyBullet2)
			enemy_play_shot()

			pattern01_shot2_time = 0
		}
	} else if oBoss3Core.pattern01_await_time <= 1 { // for a interval
		enemy_shot(x, y, pattern01_shot2_speed, image_angle)
		enemy_play_shot()
		pattern_opened = false
	} else {
		var stretching_ratio = oBoss3Core.pattern01_stretching_time / oBoss3Core.pattern01_stretching_period

		if !pattern_opened and 0.9 < stretching_ratio {
			enemy_shot(x, y, pattern01_shot3_speed, image_angle - 76)
			enemy_shot(x, y, pattern01_shot3_speed, image_angle + 76)
			enemy_shot(x, y, pattern01_shot3_speed, image_angle - 165)
			enemy_shot(x, y, pattern01_shot3_speed, image_angle + 165)
			if global.extreme {
				enemy_shot(x, y, pattern01_shot3_speed, image_angle - 90, oEnemyBullet2)
				enemy_shot(x, y, pattern01_shot3_speed, image_angle + 90, oEnemyBullet2)
			}
			enemy_play_shot()

			pattern_opened = true
		}
	}
} else if pattern == 2 {
	var hp_ratio = oBoss3Core.hp / oBoss3Core.hp_max
	if hp_ratio < 0.5 {
		if hp_ratio < 0.3 {
			pattern02_shot_period = pattern02_shot_period_min
			pattern02_shot_speed = pattern02_shot_speed_max
		} else {
			var hp_faster_ratio = 1 - (hp_ratio - 0.3) / 0.5
			pattern02_shot_period = lerp(pattern02_shot_period_max, pattern02_shot_period_min, hp_faster_ratio)
			pattern02_shot_speed = lerp(pattern02_shot_speed_min, pattern02_shot_speed_max, hp_faster_ratio)
		}
	}

	if pattern02_shot_time < pattern02_shot_period {
		pattern02_shot_time++
	} else {
		enemy_shot(x, y, pattern02_shot_speed, image_angle)
		if global.extreme
			enemy_shot(x, y, pattern02_shot_speed, 270, oEnemyBullet2)
		else
			enemy_shot(x, y, pattern02_shot_speed, 270)
		enemy_play_shot()

		pattern02_shot_time = 0
	}
} else if pattern == 3 {
	var scope_ratio = oBoss3Core.pattern03_scope_time / oBoss3Core.pattern03_scope_period
	if scope_ratio == 1 {
		if pattern03_shot_time < pattern03_shot_period {
			pattern03_shot_time++
		} else {
			var pattern03_shot_vent_left_x = x + lengthdir_x(12, image_angle + 90)
			var pattern03_shot_vent_left_y = y + lengthdir_y(12, image_angle + 90)
			var pattern03_shot_vent_right_x = x + lengthdir_x(12, image_angle - 90)
			var pattern03_shot_vent_right_y = y + lengthdir_y(12, image_angle - 90)

			if parent.type_create == LEFT {
				if pattern03_shot_count == 0 {
					if global.extreme {
						enemy_shot(pattern03_shot_vent_right_x, pattern03_shot_vent_right_y, pattern03_shot_speed, image_angle, oEnemyBullet2)
						enemy_shot(x, y, pattern03_shot_speed, image_angle)
					} else {
						enemy_shot(pattern03_shot_vent_right_x, pattern03_shot_vent_right_y, pattern03_shot_speed, image_angle)
					}
				} else if pattern03_shot_count == 2 {
					if global.extreme {
						enemy_shot(pattern03_shot_vent_left_x, pattern03_shot_vent_left_y, pattern03_shot_speed, image_angle, oEnemyBullet2)
						enemy_shot(x, y, pattern03_shot_speed, image_angle)
					} else {
						enemy_shot(pattern03_shot_vent_left_x, pattern03_shot_vent_left_y, pattern03_shot_speed, image_angle)
					}
				} else {
					if global.extreme
						enemy_shot(x, y, pattern03_shot_speed, image_angle, oEnemyBullet2)
					else
						enemy_shot(x, y, pattern03_shot_speed, image_angle)
				}
			} else if parent.type_create == RIGHT {
				if pattern03_shot_count == 0 {
					if global.extreme {
						enemy_shot(pattern03_shot_vent_left_x, pattern03_shot_vent_left_y, pattern03_shot_speed, image_angle, oEnemyBullet2)
						enemy_shot(x, y, pattern03_shot_speed, image_angle)
					} else {
						enemy_shot(pattern03_shot_vent_left_x, pattern03_shot_vent_left_y, pattern03_shot_speed, image_angle)
					}
				} else if pattern03_shot_count == 2 {
					if global.extreme {
						enemy_shot(pattern03_shot_vent_right_x, pattern03_shot_vent_right_y, pattern03_shot_speed, image_angle, oEnemyBullet2)
						enemy_shot(x, y, pattern03_shot_speed, image_angle)
					} else {
						enemy_shot(pattern03_shot_vent_right_x, pattern03_shot_vent_right_y, pattern03_shot_speed, image_angle)
					}
				} else {
					if global.extreme
						enemy_shot(x, y, pattern03_shot_speed, image_angle, oEnemyBullet2)
					else
						enemy_shot(x, y, pattern03_shot_speed, image_angle)
				}
			}

			pattern03_shot_time = 0
			pattern03_shot_count = (pattern03_shot_count + 1) mod 3
		}
	}
}

if parent.pattern != pattern {
	pattern = parent.pattern
	pattern_opened = false

	pattern00_shot_time = 0
	pattern01_shot1_time = 0
	pattern01_shot2_time = 0
	pattern02_shot_time = 0
	pattern03_shot_time = 0
}

damaged = parent.damaged
