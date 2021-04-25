hp = 3
shield = null
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

move_angle_max = 8
move_angle_speed = realforce(90)


arm_layer = layer_get_id("player_arm")
arm_left = instance_create_layer(x - 2, y + 3, arm_layer, oPlayerArm)
arm_left.image_angle = 2
arm_right = instance_create_layer(x + 2, y + 3, arm_layer, oPlayerArm)
arm_right.image_angle = 358


aura_layer = layer_get_id("player_effect_below")
hp_aura_seq = null//layer_sequence_create(aura_layer, x, y, seqPlayerAura)


border_h_0 = 29
border_h_1 = room_width - 29
border_v_0 = 28
border_v_1 = room_height - 22


global.px = x
global.py = y


/// @function cast_shield(time)
function cast_shield(time) {
	if is_null(shield) {
		shield = instance_create_layer(x, y, "player_effect_below", oPlayerShield)
		shield.duration = time
	} else {
		shield.duration = max(shield.duration, time)
	}
}


/// @function got_damage(amount=1)
function got_damage() {
	var amount = 1
	if 0 < argument_count
		amount = argument[0]

	if 0 < amount {
		hp -= amount
		stun_duration = amount * 0.3
		if 0 < hp {
			event_user(1)
		} else {
			event_user(0)
		}
	}
}

