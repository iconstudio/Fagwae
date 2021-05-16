/// @description Movements
if Delta == 0 or in_sequence
	exit


if 0 < shield_duration {
	shield_duration-- // Because of good experience for player
} else {
	
}


if 0 < stun_duration {
	stun_duration -= Delta // Because of good experience for player
	exit
} else {
	
}


var angle_arm_left, angle_arm_right
if global.io_crawl {
	if move_h_anchor == RIGHT {
		angle_arm_left = -2
		angle_arm_right = -3
	} elif move_h_anchor == LEFT {
		angle_arm_left = 3
		angle_arm_right = 2
	} else {
		angle_arm_left = 0
		angle_arm_right = 0
	}
} else if move_h_anchor == RIGHT {
	angle_arm_left = 1
	angle_arm_right = -6
} else if move_h_anchor == LEFT {
	angle_arm_left = 6
	angle_arm_right = -1
} else {
	angle_arm_left = 3
	angle_arm_right = -3
}

with arm_left {
	angle += get_rotation_next(angle, angle_arm_left, other.arm_angle_speed)

	image_angle = angle + other.image_angle
}
with arm_right {
	angle += get_rotation_next(angle, angle_arm_right, other.arm_angle_speed)

	image_angle = angle + other.image_angle
}


if global.io_attack {
	attack_rep_count = attack_rep_count_max

	if !attacking { // start
		attacking = true
	}
}

if attacking {
	if attack_rep_time < attack_rep_period {
		attack_rep_time += Delta
	} else {
		if 0 < attack_rep_count {
			var blt, sangle = 90 + image_angle
			blt = instance_create_layer(x + out_ax + lengthdir_x(40, sangle + angle_arm_right), y + 3 + out_ay + lengthdir_y(40, sangle + angle_arm_right), "player_bullet", oPlayerBullet)
			blt.direction = 90 + angle_arm_right
			blt.image_angle = blt.direction
			blt.image_index = attack_frame
			blt.speed = attack_bullet_speed

			blt = instance_create_layer(x - out_ax + lengthdir_x(40, sangle + angle_arm_left), y + 3 - out_ay + lengthdir_y(40, sangle + angle_arm_left), "player_bullet", oPlayerBullet)
			blt.direction = 90 + angle_arm_left
			blt.image_angle = blt.direction
			blt.image_index = attack_frame
			blt.speed = attack_bullet_speed

			//audio_play_sound(soundShotPlayer, 5, false)
			attack_rep_count--
		} else {
			attacking = false
		}

		attack_frame = (++attack_frame) mod 4
		attack_rep_time = 0
	}
}


var joystick_condition = false
if global.gamepad_index != -1 {
	var j_l_h = global.joy_left_h.get_value()
	var j_l_v = global.joy_left_v.get_value()

	if j_l_h != 0 or j_l_v != 0
		joystick_condition = true
}


if joystick_condition { // analog inputs
	if j_l_h == 0 { // x friction
		if move_h_velocity != 0 {
			move_h_velocity *= 0.1
		} else {
			move_h_count = 0
		}
	} else {
		move_h_velocity = move_h_speed * j_l_h
		move_h_count++
	}

	if j_l_v == 0 { // y friction
		if move_v_velocity != 0 {
			move_v_velocity *= 0.1
		} else {
			move_v_count = 0
		}
	} else {
		move_v_velocity = move_v_speed * j_l_v
		move_v_count++
	}
} else { // digital inputs
	var was_left = (move_h_anchor == LEFT)
	var was_right = (move_h_anchor == RIGHT)

	move_h_anchor = NONE
	if (global.io_p_left and global.io_right and was_right)
	or (global.io_left and !global.io_right)
	or (!global.io_p_right and global.io_left and was_left) {
		move_h_anchor = LEFT
	}
	else if (global.io_p_right and global.io_left and was_left)
	or (global.io_right and !global.io_left)
	or (!global.io_p_left and global.io_right and was_right) {
		move_h_anchor = RIGHT
	}


	var was_up = (move_v_anchor == UP)
	var was_down = (move_v_anchor == DOWN)

	move_v_anchor = NONE
	if (global.io_p_up and global.io_down and was_down)
	or (global.io_up and !global.io_down)
	or (!global.io_p_down and global.io_up and was_up) {
		move_v_anchor = UP
	}
	else if (global.io_p_down and global.io_up and was_up)
	or (global.io_down and !global.io_up)
	or (!global.io_p_up and global.io_down and was_down) {
		move_v_anchor = DOWN
	}


	if move_h_anchor != NONE {
		if move_h_count == 0 { // just pressed now
			x += move_h_anchor
			move_h_velocity = 0
		} elif move_tick_threshold <= move_h_count {
			move_h_velocity = move_h_anchor * move_h_speed
		}

		move_h_count += Delta
	} else { // friction
		if move_h_velocity != 0 {
			move_h_velocity *= 0.1
		} else {
			move_h_count = 0
		}
	}


	if move_v_anchor != NONE {
		if move_v_count == 0 { // just pressed now
			y += move_v_anchor
			move_v_velocity = 0
		} elif move_tick_threshold <= move_v_count {
			move_v_velocity = move_v_anchor * move_v_speed
		}

		move_v_count += Delta
	} else { // friction
		if move_v_velocity != 0 {
			move_v_velocity *= 0.1
		} else {
			move_v_count = 0
		}
	}
}


if global.io_crawl
	move_h_velocity *= 0.4
if global.io_crawl
	move_v_velocity *= 0.5


if move_h_velocity != 0 {
	var Hspeed = move_h_velocity * Delta// - 0.5 * Delta * Delta * move_h_fric
	x += Hspeed

	if move_h_velocity < 0
		image_angle = min(move_angle_max, image_angle + move_angle_speed * Delta)
	else
		image_angle = max(-move_angle_max, image_angle - move_angle_speed * Delta)
} else {
	image_angle -= image_angle * 0.05
}


if move_v_velocity != 0 {
	var Vspeed = move_v_velocity * Delta// - 0.5 * Delta * Delta * move_v_fric
	y += Vspeed
}

