/// @description Movements
if 0 < stun_duration {
	stun_duration -= Delta // Because of good experience for player
	exit
} else {
	
}


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
	} else {
		move_h_velocity = move_h_anchor * move_h_speed

		if global.io_crawl
			move_h_velocity *= 0.4
	}

	move_h_count += Delta
} else { // friction
	if move_h_velocity != 0 {
		if 0 < move_h_velocity {
			if move_h_fric < move_h_velocity
				move_h_velocity -= move_h_fric
			else
				move_h_velocity = 0
		} elif move_tick_threshold <= move_h_count {
			if move_h_velocity < -move_h_fric
				move_h_velocity += move_h_fric
			else
				move_h_velocity = 0
		}
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

		if global.io_crawl
			move_v_velocity *= 0.5
	}

	move_v_count += Delta
} else { // friction
	if move_v_velocity != 0 {
		if 0 < move_v_velocity {
			if move_v_fric < move_v_velocity
				move_v_velocity -= move_v_fric
			else
				move_v_velocity = 0
		} else {
			if move_v_velocity < -move_v_fric
				move_v_velocity += move_v_fric
			else
				move_v_velocity = 0
		}
	} else {
		move_v_count = 0
	}
}


if move_h_velocity != 0 {
	x += move_h_velocity

	if move_h_velocity < 0
		image_angle = min(move_angle_max, image_angle + move_angle_speed)
	else
		image_angle = max(-move_angle_max, image_angle - move_angle_speed)
} else {
	image_angle -= image_angle * 0.05
}

var angle_arm_left, angle_arm_right
if move_h_anchor == NONE {
	if global.io_left and global.io_right {
		angle_arm_left = 6
		angle_arm_right = 6
	} else {
		angle_arm_left = 2
		angle_arm_right = 2
	}
} else if move_h_anchor == RIGHT {
	angle_arm_left = 0
	angle_arm_right = 6
} else if move_h_anchor == LEFT {
	angle_arm_left = 6
	angle_arm_right = 0
}

with arm_left {
	image_angle = angle_arm_left + other.image_angle
}
with arm_right {
	image_angle = -angle_arm_right + other.image_angle
}


if move_v_velocity != 0
	y += move_v_velocity

