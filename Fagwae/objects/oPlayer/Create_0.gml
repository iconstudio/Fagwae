hp = 3
damage = 30

shield = noone
shield_duration = -1 // steps
stun_duration = 0 // real seconds


attacking = false
attack_bullet_speed = 20
attack_frame = 0
attack_rep_time = 0
attack_rep_period = 0.07
attack_rep_count = 0
attack_rep_count_max = 4


// can use realforce
move_h_speed = (226)
move_v_speed = (178)

move_h_count = 0
move_v_count = 0
move_tick_threshold = (0.03)
move_h_velocity = 0
move_v_velocity = 0
move_h_anchor = NONE
move_v_anchor = NONE


move_angle_max = 4
move_angle_speed = (90)


arm_prefab = function(x, y, orientation) constructor {
	this.sprite_index = sPlayerArm
	this.x = x
	this.y = y
	this.image_angle = orientation
	this.angle = orientation
}

arm_angle_speed = realforce(70)
arm_left = new arm_prefab(x, y + 3, 2)
arm_right = new arm_prefab(x, y + 3, 358)
out_ax = 17
out_ay = 0


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
	if !instance_exists(shield) {
		shield = instance_create_layer(x, y, "player_shield", oPlayerShield)
		shield_duration = time
	} else {
		shield_duration = max(shield_duration, time)
	}
}


/// @function got_damage(amount=1)
function got_damage() {
	if 0 < shield_duration
		exit

	var amount = 1
	if 0 < argument_count
		amount = argument[0]

	if 0 < amount {
		hp -= amount
		stun_duration = amount * 0.3

		if 0 < hp {
			hurt()
		} else {
			destroy()
		}
	}
}


/// @function hurt()
function hurt() {
	cast_shield(3)
}


/// @function destroy()
function destroy() {
	instance_destroy()
	event_user(15)
}

