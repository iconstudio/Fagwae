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
	}

	move_h_count++
} else { // friction
	if move_h_velocity != 0 {
		if 0 < move_h_velocity {
			if move_h_fric < move_h_velocity
				move_h_velocity -= move_h_fric
			else
				move_h_velocity = 0
		} else {
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
	} else {
		move_v_velocity = move_v_anchor * move_v_speed
	}

	move_v_count++
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


if move_h_velocity != 0
	x += move_h_velocity
if move_v_velocity != 0
	y += move_v_velocity

