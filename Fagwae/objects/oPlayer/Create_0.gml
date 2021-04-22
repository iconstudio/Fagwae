hp = 3
stun_duration = 0


move_h_fric = realforce(39)
move_v_fric = realforce(50)
move_h_speed = realforce(226)
move_v_speed = realforce(198)

move_h_count = 0
move_v_count = 0
move_tick_threshold = (0.03)
move_h_velocity = 0
move_v_velocity = 0
move_h_anchor = NONE
move_v_anchor = NONE


img_angle = 0
arm_layer = layer_get_id("player_arm")
arm_x = 15
arm_y = 10
arm_left = instance_create_layer(x - arm_x, y + arm_y, arm_layer, oPlayerArm)
with arm_left {
	image_angle = -16
	angle_dest = 2
}

arm_right = instance_create_layer(x + arm_x, y + arm_y, arm_layer, oPlayerArm)
with arm_right {
	image_angle = 16
	angle_dest = 358
}


aura_layer = layer_get_id("player_effect_below")
hp_aura_seq = null//layer_sequence_create(aura_layer, x, y, seqPlayerAura)


border_h_0 = 29
border_h_1 = room_width - 29
border_v_0 = 28
border_v_1 = room_height - 22


global.px = x
global.py = y


/// @function got_damage(amount=1)
function got_damage() {
	var amount = 1
	if 0 < argument_count
		amount = argument[0]

	if 0 < amount {
		hp -= amount
		if 0 < hp {
			event_user(1)
		} else {
			event_user(0)
		}
	}
}

