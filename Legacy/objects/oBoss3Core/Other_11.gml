/// @description Creation
/* 패턴: 1945 Strikers PLUS의 도시 보스를 참고.
	하나의 포탑 (Turret)
	네개의 방어구 (Plate)
	두개의 어깨 (Shoulder)
	두개의 팔 (Arm)
	네개의 집게 (Pincher)
	두개의 프로펠러 연결부 (Propeller Arm)
	
	0. out 계열의 easing 스크립트를 이용하여 걷는 모션을 취하며 등장. 이때 다발 사격.

	1-1. 양 팔을 가운데로 살짝 모으고 산탄 흩뿌리기. 익스트림에선 세줄로 사격.
	1-2e. 익스트림에선 양 팔을 벌리며 두줄 산탄 흩뿌리며 저격탄 사격.
	1-2n. 노말에선 양 팔을 벌리며 한줄 산탄 흩뿌리기.
	
	2. 왼쪽과 오른쪽 중 플레이어가 있는 방향으로 이동하며 양 팔에서 산탄 흩뿌리기.
	익스트림에선 3줄 사격과 동시에 보스에서 확산탄 사격. 체력이 낮아지면 이 과정
	순식간에 이루어짐. 1초안에서 이동과 모든 탄 흩뿌리기를 완료함.

	3. 잠시 대기 후 제자리에서 플레이어를 향해 양 팔에서 산탄 흩뿌리기.

	4. 다시 제자리에서 몸체에서 다량의 확산탄 흩뿌리며 저격 산탄 사격.
	익스트림은 더 오래 사격.

	5. 다시 중앙으로 돌아오고 팔을 번갈아가며 빠르게 뻗으며 산탄 사격.

	6. 팔이 천천히 앞으로 되돌아오며 양 옆에서 oFrameTriangleSide 여러기 등장.
	익스트림에선 엄청 많이 나옴. 그리고 산탄 사격.

	7. 저격 산탄을 뿌리고 패턴 2로 되돌아감.
*/
name = "Thruster"
layer = layer_get_id("Boss_A")
x = room_width * 0.5
y = -120

#region arms
arm_number = 0
arm_startangle = 0
arm_properties = 0

// head
enemy_arm_add_coord(enemy_boss_3_turret, x, y, noone, "Boss_Above")

// 4 vents
vent_backleft = enemy_arm_add_coord(enemy_boss_3_vent, x - 30, y - 34, noone, "Boss_Above")
vent_frontleft = enemy_arm_add_coord(enemy_boss_3_vent, x - 41, y + 24, noone, "Boss_Above")
vent_backright = enemy_arm_add_coord(enemy_boss_3_vent, x + 30, y - 34, noone, "Boss_Above")
vent_frontright = enemy_arm_add_coord(enemy_boss_3_vent, x + 41, y + 24, noone, "Boss_Above")

failsafe = false
failsafe_ratio = 0
failsafe_distance_front = 160
failsafe_distance_back = global.extreme ? 0 : 90

var plate_coord = 32.75
var plate_angle = point_direction(0, 0, 29.375, 5.4)
// 2 front plates
enemy_arm_add_coord(enemy_boss_3_plate, x - plate_coord, y + 58, noone, "Boss_C")
enemy_arm_add_coord(enemy_boss_3_plate, x + plate_coord, y + 58, noone, "Boss_C")

// 2 back plates
with enemy_arm_add_coord(enemy_boss_3_backplate, x - plate_coord, y - 56, noone, "Boss_C") {
	image_yscale = 0.3

	arm_angle_fixed = 180 - plate_angle
	image_angle = arm_angle_fixed
}
with enemy_arm_add_coord(enemy_boss_3_backplate, x + plate_coord, y - 56, noone, "Boss_C") {
	image_yscale = 0.3

	arm_angle_fixed = plate_angle
	image_angle = arm_angle_fixed
}

// 2 shoulders
var shoulder_hypo_length = 64 * sqrt(2)
var shoulder_y = y - 54 + shoulder_hypo_length * 0.5
with enemy_arm_add_coord(enemy_boss_3_sholuder, x - 70, shoulder_y, noone, "Boss_B") {
	arm_angle_fixed = 315
	image_angle = arm_angle_fixed
}
with enemy_arm_add_coord(enemy_boss_3_sholuder, x + 70, shoulder_y, noone, "Boss_B") {
	arm_angle_fixed = 225
	image_angle = arm_angle_fixed
}

// 2 arms
var arm_hypo_length = 32 * sqrt(2)
var arm_y = shoulder_y + arm_hypo_length * 0.5 - 7
arm_left = enemy_arm_add_coord(enemy_boss_3_arm, x - 74 - arm_hypo_length * 0.5, arm_y, noone, "Boss_B")
with arm_left {
	type_create = LEFT
	arm_angle_fixed = 270
	image_angle = arm_angle_fixed

	enemy_arm_init(enemy_boss_3_pincher, 1, 64)
	with enemy_arm_add_coord(enemy_boss_3_spike, x + 20, y + 5, noone, "Boss_C") {
		arm_angle_fixed = -83
		image_angle = arm_angle_fixed

		invincible = INVINCIBLE_NONE
	}
}
arm_right = enemy_arm_add_coord(enemy_boss_3_arm, x + 74 + arm_hypo_length * 0.5, arm_y, noone, "Boss_B")
with arm_right {
	type_create = RIGHT
	arm_angle_fixed = 270
	image_angle = arm_angle_fixed

	enemy_arm_init(enemy_boss_3_pincher, 1, 64)
	with enemy_arm_add_coord(enemy_boss_3_spike, x + 20, y - 5, noone, "Boss_C") {
		arm_angle_fixed = 83
		image_angle = arm_angle_fixed

		invincible = INVINCIBLE_NONE
	}
}

// 2 propellers
propeller_left = enemy_arm_add_coord(enemy_boss_3_propellerarm, x - 62, y - 46, noone, "Boss_C")
with propeller_left {
	arm_angle_fixed = 124
	image_angle = arm_angle_fixed
	rotation_sign = -1
}
propeller_right = enemy_arm_add_coord(enemy_boss_3_propellerarm, x + 62, y - 46, noone, "Boss_C")
with propeller_right {
	arm_angle_fixed = 56
	image_angle = arm_angle_fixed
}

// 4 spikes
spike_left = enemy_arm_add_coord(enemy_boss_3_spike, x - 82, y - 20, noone, "Boss_C")
with spike_left { // on the left shoulder
	sprite_index = sFrameJoint
	arm_angle_fixed = 146
	image_angle = arm_angle_fixed
}
with enemy_arm_add_coord(enemy_boss_3_spike, x - 40, y - 54, noone, "Boss_C") { // on the left back
	sprite_index = sFrameJoint
	arm_angle_fixed = 60
	image_angle = arm_angle_fixed

	image_xscale = 0.61
}
spike_right = enemy_arm_add_coord(enemy_boss_3_spike, x + 82, y - 20, noone, "Boss_C")
with spike_right { // on the right shoulder
	sprite_index = sFrameJoint
	arm_angle_fixed = 34
	image_angle = arm_angle_fixed
}
with enemy_arm_add_coord(enemy_boss_3_spike, x + 40, y - 54, noone, "Boss_C") { // on the right back
	sprite_index = sFrameJoint
	arm_angle_fixed = 120
	image_angle = arm_angle_fixed

	image_xscale = 0.61
}
#endregion

pattern = 0
pattern_opened = false
pattern_hp_low = false

#region PATTERN 0~5
pattern00_time = 0 // time to finish a step
pattern00_period = seconds(0.4)
pattern00_await_time = 0 // between a step and a step
pattern00_await_period = seconds(0.6)
pattern00_distance = 40
pattern00_y_begin = y
pattern00_y_destination = 290

pattern01_pinching_time = 0
pattern01_pinching_period = seconds(1.8)
pattern01_pinching_forward_distance = 210
pattern01_pinching_backward_distance = 14
pattern01_await_time = 0 // between pinching and stretching
pattern01_await_period = seconds(1)
pattern01_await_attack_time = 0 // before starting attack
pattern01_await_attack_period = seconds(0.2)
pattern01_await_shot_direction = 0
pattern01_await_shot_count = 0 // for shot
pattern01_await_shot_time = 0
pattern01_await_shot_period = seconds(0.11)
pattern01_await_shot_protect_count = 0 // for sideshot at extreme mode
pattern01_await_shot_protect_time = 0
pattern01_await_shot_protect_period = seconds(0.06)
pattern01_await_shot_speed = enemy_bullet_speed_slow
pattern01_stretching_time = 0
pattern01_stretching_period = seconds(1.3)
pattern01_recover_time = 0
pattern01_recover_period = seconds(0.6)
pattern01_recover_x_begin = x
pattern01_recover_x_target = x
pattern01_recover_y_begin = y
pattern01_recover_shot_speed = enemy_bullet_speed_medium

pattern02_time = 0
pattern02_period = seconds(4)
pattern02_period_min = seconds(1)
pattern02_period_max = pattern02_period
pattern02_x_begin = x
pattern02_x_target = x
pattern02_y_begin = y
pattern02_y_target = pattern00_y_destination - 74

pattern03_time = 0
pattern03_period = seconds(global.extreme ? 4 : 5)
pattern03_scope_time = 0 // scoping arms to player
pattern03_scope_period = seconds(0.4)
pattern03_angle = 270
pattern03_angle_begin = pattern03_angle
pattern03_angle_target = pattern03_angle
pattern03_angular_time = seconds(3) // rotating to player
pattern03_angular_period = pattern03_angular_time
pattern03_shot_time = 0
pattern03_shot_period = seconds(0.1)

pattern04_angle = 270
pattern04_angle_begin = pattern03_angle
pattern04_angular_time = 0 // rotating to origin
pattern04_angular_period = seconds(0.4)
pattern04_x_begin = x
pattern04_y_begin = y
pattern04_x_target = x
pattern04_y_target = y
pattern04_shot1_count = 0 // spreding steadily
pattern04_shot1_time = 0
pattern04_shot1_period = seconds(0.2)
pattern04_shot1_speed = enemy_bullet_speed_slower
pattern04_shot2_count = 0 // spreding rapidly
pattern04_shot2_time = 0
pattern04_shot2_period = seconds(global.extreme ? 0.22 : 0.32)
pattern04_shot2_speed = enemy_bullet_speed_slow
pattern04_move_time = 0
pattern04_move_period = seconds(1)
pattern04_time = 0
pattern04_period = seconds(global.extreme ? 5 : 4)

pattern05_angle = 270
pattern05_move_y_destination = pattern00_y_destination - 26
pattern05_move_time = 0
pattern05_move_period = seconds(1.1)
pattern05_hook_count = 0
pattern05_hook_count_max = global.extreme ? 2 : 3
pattern05_hook_first = LEFT
pattern05_hook_forward = noone
pattern05_hook_backward = noone
pattern05_hook_index = 0
pattern05_hook_back_y_destination = pattern05_move_y_destination - 190
pattern05_hook_back_time = -seconds(0.5)
pattern05_hook_back_period = seconds(0.8)
pattern05_hook_attack_time = 0
pattern05_hook_attack_period = seconds(0.5)
pattern05_hook_recover_time = 0
pattern05_hook_recover_period = seconds(0.9)
pattern05_return_time = 0
pattern05_return_period = seconds(0.6)
#endregion

pattern06_07_vent_time = 0
pattern06_07_vent_period = seconds(14)
pattern06_07_vent_shot_count = 0
pattern06_07_vent_shot_time = 0
pattern06_07_vent_shot_period = seconds(0.07)
pattern06_07_vent_shot_speed = global.extreme ? enemy_bullet_speed_slower : enemy_bullet_speed_medium

pattern06_arming_angle = 225
pattern06_arming_sign = 1
pattern06_arming_time = 0
pattern06_arming_period = seconds(0.8)
pattern06_arm_rotation = 0
pattern06_arm_rotate_time = 0
pattern06_arm_rotate_period = seconds(1)
pattern06_summon_time = 0
pattern06_summon_period = seconds(global.extreme ? 5 : 3)
pattern06_summon_piece_time = 0
//pattern06_summon_piece_period = seconds(global.extreme ? 0.6 : 0.7)

pattern07_arming_time = 0
pattern07_arming_period = seconds(2)
pattern07_turret_time = 0
pattern07_turret_period = seconds(3.5)

dying_angle = random_range(-20, 20)
dying_angle_time = 0
dying_angle_period = seconds(1.6)
