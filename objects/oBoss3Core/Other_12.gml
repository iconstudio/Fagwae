/// @description Update
if dead or hp <= 0 {
	if dying_angle_time < dying_angle_period {
		image_angle = lerp(0, dying_angle, ease_in_out_elastic(dying_angle_time / dying_angle_period))
		
		dying_angle_time++
	} else {
		image_angle = dying_angle
	}
	exit
}

if !global.playeralive
	exit

if global.py < y + failsafe_distance_front {
	failsafe = true

	if global.py < y - failsafe_distance_back
		failsafe_ratio = 0
	else
		failsafe_ratio = 1 - (y + failsafe_distance_front - global.py) / (y - failsafe_distance_back - global.py)
} else {
	failsafe = false
}

if 5 < pattern {
	if pattern06_07_vent_time < pattern06_07_vent_period {
		if pattern06_07_vent_shot_time < pattern06_07_vent_shot_period {
			pattern06_07_vent_shot_time++
		} else {
			enemy_shot(vent_backleft.x, vent_backleft.y, pattern06_07_vent_shot_speed, pattern06_07_vent_shot_count * 24)
			enemy_shot(vent_backright.x, vent_backright.y, pattern06_07_vent_shot_speed, 180 + pattern06_07_vent_shot_count * 24)

			pattern06_07_vent_shot_time = 0
			pattern06_07_vent_shot_count++
		}

		pattern06_07_vent_time++
	}
}

if pattern == 0 {
#region PATTERN 0~1
	if pattern00_time < pattern00_period {
		pattern00_time++
	} else {
		if pattern00_await_time < pattern00_await_period {
			pattern00_await_time++
		} else {
			pattern00_time = 0
			pattern00_await_time = 0

			pattern00_y_begin = y

			if pattern00_y_destination < y {
				pattern = 1
				pattern00_y_destination = y // renew to current coordinate
				pattern02_y_target = pattern00_y_destination - 74
			}
		}
	}

	y = lerp(pattern00_y_begin, pattern00_y_begin + pattern00_distance, ease_out_quad(pattern00_time / pattern00_period))
} else if pattern == 1 {
	if pattern01_pinching_time < pattern01_pinching_period { // going forward
		var pinching_ratio = ease_in_out_cubic(pattern01_pinching_time / pattern01_pinching_period)

		if pinching_ratio <= 0.2 {
			var pinching_backward_ratio = pinching_ratio * 5
			with arm_left {
				arm_angle_fixed = 270 - pinching_backward_ratio * 20 // 250
			}
			with arm_right {
				arm_angle_fixed = 270 + pinching_backward_ratio * 20 // 290
			}

			y = lerp(pattern00_y_destination, pattern00_y_destination - pattern01_pinching_backward_distance, pinching_backward_ratio)
		} else {
			var pinching_forward_ratio = (pinching_ratio - 0.2) / 0.8
			with arm_left {
				arm_angle_fixed = lerp(250, 300, pinching_forward_ratio)
			}
			with arm_right {
				arm_angle_fixed = lerp(290, 240, pinching_forward_ratio)
			}

			y = lerp(pattern00_y_destination - pattern01_pinching_backward_distance, pattern00_y_destination + pattern01_pinching_forward_distance, pinching_forward_ratio)
		}

		pattern01_pinching_time++
	} else if pattern01_await_time < pattern01_await_period { // staying here
		y = pattern00_y_destination + pattern01_pinching_forward_distance

		if global.extreme and pattern01_await_shot_protect_count < 11 {
			if pattern01_await_shot_protect_time < pattern01_await_shot_protect_period {
				pattern01_await_shot_protect_time++
			} else {
				enemy_shot(vent_frontleft.x, vent_frontleft.y, pattern01_await_shot_speed, 45 - pattern01_await_shot_protect_count * 9)
				enemy_shot(vent_frontright.x, vent_frontright.y, pattern01_await_shot_speed, 135 + pattern01_await_shot_protect_count * 9)
				if !audio_is_playing(soundShotEnemy)
					enemy_play_shot()

				pattern01_await_shot_protect_time = 0
				pattern01_await_shot_protect_count++
			}
		}

		if pattern01_await_attack_time < pattern01_await_attack_period {
			pattern01_await_attack_time++
			
			if pattern01_await_attack_time == pattern01_await_attack_period
				pattern01_await_shot_direction = point_direction(x, y, global.px, global.py)
		} else {
			if pattern01_await_shot_time < pattern01_await_shot_period {
				pattern01_await_shot_time++
			} else {
				if pattern01_await_shot_count < 7 {
					if pattern01_await_shot_time < pattern01_await_shot_period {
						pattern01_await_shot_time++
					} else {
						var pattern01_await_shot_interval = pattern01_await_shot_count * 7
						with enemy_shot(vent_backleft.x, vent_backleft.y, pattern01_await_shot_speed, pattern01_await_shot_direction - 35 + pattern01_await_shot_interval)
							motion_add(other.pattern01_await_shot_direction, 0.5)
						with enemy_shot(vent_backright.x, vent_backright.y, pattern01_await_shot_speed, pattern01_await_shot_direction + 35 - pattern01_await_shot_interval)
							motion_add(other.pattern01_await_shot_direction, 0.5)
						enemy_play_shot()

						pattern01_await_shot_time = 0
						pattern01_await_shot_count++
					}
				}

				pattern01_await_shot_time = 0
			}
		}

		pattern01_await_time++
	} else if pattern01_stretching_time < pattern01_stretching_period { // going back
		var stretching_ratio = pattern01_stretching_time / pattern01_stretching_period
		with arm_left {
			arm_angle_fixed = lerp(300, 200, stretching_ratio)
		}
		with arm_right {
			arm_angle_fixed = lerp(240, 340, stretching_ratio)
		}

		y = lerp(pattern00_y_destination + pattern01_pinching_forward_distance, pattern00_y_destination, ease_out_quartic(stretching_ratio))

		pattern01_stretching_time++
		if pattern01_stretching_time == pattern01_stretching_period {
			pattern01_recover_x_begin = x
			pattern01_recover_y_begin = y
			if global.px < x
				pattern01_recover_x_target = 238
			else if x < global.px
				pattern01_recover_x_target = 302
			else
				pattern01_recover_x_target = x
		}
	} else if pattern01_recover_time < pattern01_recover_period {
		var recover_ratio = pattern01_recover_time / pattern01_recover_period
		var recover_move_ratio = ease_in_expo(recover_ratio)
		with arm_left {
			arm_angle_fixed = lerp(200, 257, recover_ratio)
		}
		with arm_right {
			arm_angle_fixed = lerp(340, 283, recover_ratio)
		}

		x = lerp(pattern01_recover_x_begin, pattern01_recover_x_target, recover_move_ratio)
		y = lerp(pattern01_recover_y_begin, pattern00_y_destination - 20, recover_ratio)

		pattern01_recover_time++
	} else {
		var vent_shot_direction = point_direction(vent_frontleft.x, vent_frontleft.y, global.px, global.py)
		enemy_shot(vent_frontleft.x, vent_frontleft.y, pattern01_recover_shot_speed, vent_shot_direction - 20)
		enemy_shot(vent_frontleft.x, vent_frontleft.y, pattern01_recover_shot_speed, vent_shot_direction)
		enemy_shot(vent_frontleft.x, vent_frontleft.y, pattern01_recover_shot_speed, vent_shot_direction + 20)
		vent_shot_direction = point_direction(vent_frontright.x, vent_frontright.y, global.px, global.py)
		enemy_shot(vent_frontright.x, vent_frontright.y, pattern01_recover_shot_speed, vent_shot_direction - 20)
		enemy_shot(vent_frontright.x, vent_frontright.y, pattern01_recover_shot_speed, vent_shot_direction)
		enemy_shot(vent_frontright.x, vent_frontright.y, pattern01_recover_shot_speed, vent_shot_direction + 20)
		enemy_play_shot()

		pattern = 2
		pattern_opened = false
		pattern02_x_begin = x
		pattern02_y_begin = y
		if pattern01_recover_x_target < 270
			pattern02_x_target = 130
		else if 270 < pattern01_recover_x_target
			pattern02_x_target = 410
		else
			pattern02_x_target = 270
		var hp_ratio = hp / hp_max
		if hp_ratio < 0.5 { // reducing durations for moving
			if hp_ratio < 0.3
				pattern02_period = pattern02_period_min
			else
				pattern02_period = lerp(pattern02_period_max, pattern02_period_min, 1 - (hp_ratio - 0.3) / 0.5)
		}
	}
#endregion
} else if pattern == 2 { // starting a loop
#region PATTERN 2~4
	if pattern02_time < pattern02_period {
		var move_ratio = pattern02_time / pattern02_period
		x = lerp(pattern02_x_begin, pattern02_x_target, move_ratio)
		y = lerp(pattern02_y_begin, pattern02_y_target, move_ratio)

		pattern02_time++
	} else {
		x = pattern02_x_target
		y = pattern02_y_target
		pattern02_time = 0

		pattern = 3
		pattern_opened = false
	}
} else if pattern == 3 {
	image_angle = pattern03_angle - 270

	if pattern03_angular_time < pattern03_angular_period {
		var angular_ratio = pattern03_angular_time / pattern03_angular_period
		pattern03_angle = lerp(pattern03_angle_begin, pattern03_angle_target, angular_ratio)

		pattern03_angular_time++
	} else {
		var player_direction = point_direction(x, y, global.px, global.py)
		if pattern03_angle_target != player_direction {
			pattern03_angle_begin = pattern03_angle
			pattern03_angle_target = player_direction

			var rotation_fix = pattern03_angle_target - pattern03_angle_begin
			if rotation_fix > 180
				pattern03_angle_begin += 360
			else if rotation_fix < -180
				pattern03_angle_begin -= 360

			pattern03_angular_time = 0
		}
	}

	if pattern03_time < pattern03_period {
		var pattern03_ratio = pattern03_time / pattern03_period
		var scope_ratio = pattern03_scope_time / pattern03_scope_period
		with arm_left {
			arm_angle_fixed = lerp(250, 280, scope_ratio)
		}
		with arm_right {
			arm_angle_fixed = lerp(290, 260, scope_ratio)
		}

		if 0.2 < pattern03_ratio {
			if pattern03_scope_time < pattern03_scope_period
				pattern03_scope_time++
			else
				pattern03_scope_time = pattern03_scope_period
		}

		pattern03_time++
	} else {
		pattern04_angle = pattern03_angle
		pattern04_angle_begin = pattern03_angle
		pattern03_time = 0
		pattern03_scope_time = 0
		pattern03_angle = 270
		pattern03_angle_begin = 270
		pattern03_angle_target = 270
		pattern03_angular_time = pattern03_angular_period

		pattern = 4
		pattern_opened = false
		pattern04_x_begin = x
		pattern04_y_begin = y
		pattern04_x_target = 270
		pattern04_y_target = pattern00_y_destination
	}
} else if pattern == 4 {
	image_angle = pattern04_angle - 270

	if pattern04_angular_time < pattern04_angular_period {
		var angular_ratio = pattern04_angular_time / pattern04_angular_period
		pattern04_angle = lerp(pattern04_angle_begin, 270, angular_ratio)

		pattern04_angular_time++
	} else {
		pattern04_angle = 270
	}

	var move_ratio = pattern04_time / pattern04_period
	x = lerp(pattern04_x_begin, pattern04_x_target, move_ratio)
	y = lerp(pattern04_y_begin, pattern04_y_target, move_ratio)

	if pattern04_move_time < pattern04_move_period
		pattern04_move_time++
	else
		pattern04_move_time = pattern04_move_period

	if pattern04_shot1_time < pattern04_shot1_period {
		pattern04_shot1_time++
	} else {
		enemy_shot(vent_backleft.x, vent_backleft.y, pattern04_shot1_speed, 24 - pattern04_shot1_count * 4)
		enemy_shot(vent_backright.x, vent_backright.y, pattern04_shot1_speed, 156 + pattern04_shot1_count * 4)
		enemy_play_shot()

		pattern04_shot1_count++
		pattern04_shot1_time = 0
	}

	if pattern04_shot2_time < pattern04_shot2_period {
		pattern04_shot2_time++
	} else {
		for (var i = 0; i < 8; ++i) {
			enemy_shot(vent_frontleft.x, vent_frontleft.y, pattern04_shot2_speed, 90 + pattern04_shot2_count * 12 + i * 45)
			enemy_shot(vent_frontright.x, vent_frontright.y, pattern04_shot2_speed, 90 - pattern04_shot2_count * 12 + i * 45)
		}
		enemy_play_shot()

		pattern04_shot2_count++
		pattern04_shot2_time = 0
	}

	if pattern04_time < pattern04_period {
		pattern04_time++
	} else {
		pattern04_angular_time = 0
		pattern04_shot1_count = 0
		pattern04_shot2_count = 0
		pattern04_shot1_time = 0
		pattern04_shot2_time = 0
		pattern04_move_time = 0
		pattern04_time = 0

		pattern = 5
		pattern_opened = false
		pattern05_hook_first = choose(LEFT, RIGHT)
		if pattern05_hook_first == LEFT {
			pattern05_hook_forward = arm_left
			pattern05_hook_backward = arm_right
		} else if pattern05_hook_first == RIGHT {
			pattern05_hook_forward = arm_right
			pattern05_hook_backward = arm_left
		}
	}
#endregion
} else if pattern == 5 {
#region PATTERN 5
	image_angle = pattern05_angle - 270

	if pattern05_move_time < pattern05_move_period {
		var pattern05_ready_ratio = pattern05_move_time / pattern05_move_period
		with arm_left {
			arm_angle_fixed = lerp(280, 270, pattern05_ready_ratio)
		}
		with arm_right {
			arm_angle_fixed = lerp(260, 270, pattern05_ready_ratio)
		}

		y = lerp(pattern00_y_destination, pattern05_move_y_destination, pattern05_ready_ratio)

		pattern05_move_time++
	} else if pattern05_hook_count < pattern05_hook_count_max {
		with arm_left {
			arm_angle_fixed = -other.image_angle + 270
		}
		with arm_right {
			arm_angle_fixed = -other.image_angle + 270
		}

		if pattern05_hook_back_time < pattern05_hook_back_period { // going to back a little
			var hooking_back_ratio = max(0, pattern05_hook_back_time / pattern05_hook_back_period)
			if pattern05_hook_first == LEFT {
				if pattern05_hook_index == 0 // tilting to left
					pattern05_angle = lerp(270, 220, hooking_back_ratio)
				else if pattern05_hook_index == 1
					pattern05_angle = lerp(270, 320, hooking_back_ratio)
			} else { // right
				if pattern05_hook_index == 0 // tilting to right
					pattern05_angle = lerp(270, 320, hooking_back_ratio)
				else if pattern05_hook_index == 1
					pattern05_angle = lerp(270, 220, hooking_back_ratio)
			}

			y = lerp(pattern05_move_y_destination, pattern05_hook_back_y_destination, hooking_back_ratio)

			pattern05_hook_back_time++
		} else if pattern05_hook_attack_time < pattern05_hook_attack_period { // going to front
			var hooking_front_ratio = pattern05_hook_attack_time / pattern05_hook_attack_period
			if pattern05_hook_first == LEFT {
				if pattern05_hook_index == 0 // tilting from left to right
					pattern05_angle = lerp(220, 320, hooking_front_ratio)
				else if pattern05_hook_index == 1
					pattern05_angle = lerp(320, 220, hooking_front_ratio)
			} else { // right
				if pattern05_hook_index == 0 // tilting from right to left
					pattern05_angle = lerp(320, 220, hooking_front_ratio)
				else if pattern05_hook_index == 1
					pattern05_angle = lerp(220, 320, hooking_front_ratio)
			}

			y = lerp(pattern05_hook_back_y_destination, pattern00_y_destination, ease_out_quad(hooking_front_ratio))

			pattern05_hook_attack_time++
		} else if pattern05_hook_recover_time < pattern05_hook_recover_period {
			var hooking_recover_ratio = pattern05_hook_recover_time / pattern05_hook_recover_period
			var hooking_recover_angle_ratio = ease_in_out_cubic(hooking_recover_ratio)
			if pattern05_hook_first == LEFT {
				if pattern05_hook_index == 0
					pattern05_angle = lerp(320, 270, hooking_recover_angle_ratio)
				else if pattern05_hook_index == 1
					pattern05_angle = lerp(220, 270, hooking_recover_angle_ratio)
			} else {
				if pattern05_hook_index == 0
					pattern05_angle = lerp(220, 270, hooking_recover_angle_ratio)
				else if pattern05_hook_index == 1
					pattern05_angle = lerp(320, 270, hooking_recover_angle_ratio)
			}

			y = lerp(pattern00_y_destination, pattern05_move_y_destination, hooking_recover_ratio)

			pattern05_hook_recover_time++
		} else {
			pattern05_hook_back_time = 0
			pattern05_hook_attack_time = 0
			if 1 < ++pattern05_hook_index {
				pattern05_hook_index = 0
				pattern05_hook_count++
			}
			pattern05_hook_recover_time = 0
		}
	} else { // recover arms
		var return_ratio = pattern05_return_time / pattern05_return_period
		with arm_left {
			arm_angle_fixed = lerp(arm_angle_fixed, 270, return_ratio)
		}
		with arm_right {
			arm_angle_fixed = lerp(arm_angle_fixed, 270, return_ratio)
		}

		if pattern05_return_time < pattern05_return_period {
			pattern05_return_time++
		} else {
			pattern05_angle = 270
			pattern05_move_time = 0
			pattern05_hook_count = 0
			pattern05_hook_index = 0
			pattern05_hook_back_time = -seconds(0.5)
			pattern05_hook_attack_time = 0
			pattern05_hook_recover_time = 0
			pattern05_return_time = 0

			pattern = 6
			pattern_opened = false
			pattern06_arming_angle = choose(255, 315)
			if pattern06_arming_angle == 255
				pattern06_arming_sign = 1
			else
				pattern06_arming_sign = -1
		}
	}
#endregion
} else if pattern == 6 {
	if pattern06_arming_time < pattern06_arming_period {
		var arming_ratio = pattern06_arming_time / pattern06_arming_period
		with arm_left {
			arm_angle_fixed = lerp(270, other.pattern06_arming_angle, arming_ratio)
		}
		with arm_right {
			arm_angle_fixed = lerp(270, other.pattern06_arming_angle, arming_ratio)
		}

		pattern06_arming_time++
	} else {
		var arming_angle = pattern06_arming_angle + min(95, lengthdir_y(90, pattern06_arm_rotation)) * pattern06_arming_sign
		with arm_left {
			arm_angle_fixed = arming_angle
		}
		with arm_right {
			arm_angle_fixed = arming_angle
		}

		pattern06_arm_rotation = 360 * pattern06_arm_rotate_time / pattern06_arm_rotate_period
		if pattern06_arm_rotate_time < pattern06_arm_rotate_period
			pattern06_arm_rotate_time++
		else
			pattern06_arm_rotate_time = 0

		if pattern06_summon_time < pattern06_summon_period {
			// Obsolete

			pattern06_summon_time++
		} else {
			pattern06_arming_time = 0
			pattern06_arm_rotate_time = 0
			pattern06_summon_time = 0
			pattern06_summon_piece_time = 0

			pattern = 7
			pattern_opened = false
		}
	}
} else if pattern == 7 {
	if pattern07_arming_time < pattern07_arming_period {
		var arming_ratio = pattern07_arming_time / pattern07_arming_period
		var arming_angle = pattern06_arming_angle + lengthdir_y(15, pattern06_arm_rotation)
		with arm_left {
			arm_angle_fixed = lerp(arming_angle, 257, arming_ratio)
		}
		with arm_right {
			arm_angle_fixed = lerp(arming_angle, 283, arming_ratio)
		}

		pattern07_arming_time++
	}

	if pattern07_turret_time < pattern07_turret_period {
		pattern07_turret_time++
	} else {
		pattern06_07_vent_time = 0
		pattern06_07_vent_shot_count = 0
		pattern06_07_vent_shot_time = 0
		pattern07_arming_time = 0
		pattern07_turret_time = 0

		pattern = 2
		pattern_opened = false
		pattern02_x_begin = x
		pattern02_y_begin = y
		pattern02_x_target = choose(130, 410)
		var hp_ratio = hp / hp_max
		if hp_ratio < 0.5 {
			if hp_ratio < 0.3
				pattern02_period = pattern02_period_min
			else
				pattern02_period = lerp(pattern02_period_max, pattern02_period_min, 1 - (hp_ratio - 0.3) / 0.5)
		}
	}
}

var speed_previous = speed, direction_previous = direction
for (var i = 0; i < arm_number; ++i) {
	arm = arm_properties[i]

	if instance_exists(arm[0]) {
		speed = arm[1]
		direction = arm[2] + image_angle
		arm[0].x = x + hspeed
		arm[0].y = y + vspeed
		arm[0].image_angle = arm[0].arm_angle_fixed + image_angle
	}
}
speed = speed_previous
direction = direction_previous

if arm_left.image_angle != 270 {
	var arm_angle_left_gab = (arm_left.image_angle - 270) * 0.4
	
	propeller_left.image_angle += arm_angle_left_gab
	spike_left.image_angle += arm_angle_left_gab
}

if arm_right.image_angle != 270 {
	var arm_angle_right_gab = (arm_right.image_angle - 270) * 0.4
	
	propeller_right.image_angle += arm_angle_right_gab
	spike_right.image_angle += arm_angle_right_gab
}
