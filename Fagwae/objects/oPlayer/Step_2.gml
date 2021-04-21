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


global.px = x
global.py = y


var out_ax = lengthdir_x(17, img_angle)
var out_ay = lengthdir_y(17, img_angle)
arm_left.x = x - out_ax
arm_left.y = y + 3 + out_ay
arm_right.x = x + out_ax
arm_right.y = y + 3 - out_ay


if !is_null(hp_aura_seq) {
	if layer_sequence_is_finished(hp_aura_seq)
		layer_sequence_play(hp_aura_seq)

	layer_sequence_x(hp_aura_seq, x)
	layer_sequence_y(hp_aura_seq, y)
}
