hp = 3


move_h_fric = realforce(39)
move_v_fric = realforce(50)
move_h_speed = realforce(176)
move_v_speed = realforce(142)

move_h_count = 0
move_v_count = 0
move_h_velocity = 0
move_v_velocity = 0
move_h_anchor = NONE
move_v_anchor = NONE


arm_layer = layer_get_id("player_arm")
arm_x = 15
arm_y = 10
arm_left = instance_create_layer(x - arm_x, y + arm_y, arm_layer, oPlayerArm)
arm_right = instance_create_layer(x + arm_x, y + arm_y, arm_layer, oPlayerArm)
print(arm_left)
print(arm_right)


aura_layer = layer_get_id("player_effect_below")
hp_aura_seq = null //layer_sequence_create(aura_layer, x, y, seqPlayerAura)


border_h_0 = sprite_xoffset
border_h_1 = room_width - sprite_xoffset
border_v_0 = sprite_yoffset
border_v_1 = room_height - sprite_yoffset


global.px = x
global.py = y

