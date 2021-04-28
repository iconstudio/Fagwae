/// @description Positions
if x < border_h_0 {
	x = border_h_0
	move_h_count = 0
	move_h_velocity = 0
} elif border_h_1 <= x {
	x = border_h_1
	move_h_count = 0
	move_h_velocity = 0
}


if y < border_v_0 {
	y = border_v_0
	move_v_count = 0
	move_v_velocity = 0
} elif border_v_1 <= y {
	y = border_v_1
	move_v_count = 0
	move_v_velocity = 0
}

if in_sequence {
	var out_ax = 17 * image_xscale
	var out_ay = 3 * image_yscale

	with arm_left {
		x = global.px - out_ax
		y = global.py + out_ay
	}

	with arm_right {
		x = global.px + out_ax
		y = global.py + out_ay
	}
} else {
	var out_ax = lengthdir_x(17, image_angle)
	var out_ay = lengthdir_y(17, image_angle)

	with arm_left {
		x = other.x - out_ax
		y = other.y + 3 - out_ay
	}

	with arm_right {
		x = other.x + out_ax
		y = other.y + 3 + out_ay
	}
}


global.px = x
global.py = y


if !is_null(hp_aura_seq) {
	if layer_sequence_is_finished(hp_aura_seq)
		layer_sequence_play(hp_aura_seq)

	layer_sequence_x(hp_aura_seq, x)
	layer_sequence_y(hp_aura_seq, y)
}
