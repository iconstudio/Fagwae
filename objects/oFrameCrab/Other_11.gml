/// @description Creation
arm_instances = array_create(8)
arm_angle = array_create(8)
arm_distance = array_create(8)
arm_number = 0

arm_angle[arm_number] = point_direction(0, 0, 16, 12)
arm_instances[arm_number] = enemy_create(enemy_joint_1, x + 16, y + 12, 0, arm_angle[arm_number], id, "Instances_Arms")
arm_distance[arm_number] = point_distance(0, 0, 16, 12)
with arm_instances[arm_number++] { // 0: front right
	invincible = INVINCIBLE_PARENTAL
	image_xscale = 0.2
}
arm_angle[arm_number] = point_direction(0, 0, 16, -13)
arm_instances[arm_number] = enemy_create(enemy_joint_1, x + 16, y - 13, 0, arm_angle[arm_number], id, "Instances_Arms")
arm_distance[arm_number] = point_distance(0, 0, 16, -13)
with arm_instances[arm_number++] { // 1: front left
	invincible = INVINCIBLE_PARENTAL
	image_xscale = 0.2
}
arm_angle[arm_number] = point_direction(0, 0, 11, 21)
arm_instances[arm_number] = enemy_create(enemy_joint_1, x + 11, y + 21, 0, arm_angle[arm_number], id, "Instances_Arms")
arm_distance[arm_number] = point_distance(0, 0, 11, 21)
with arm_instances[arm_number++] { // 2: side-front right
	invincible = INVINCIBLE_PARENTAL
	image_xscale = 0.8
}
arm_angle[arm_number] = point_direction(0, 0, 11, -22)
arm_instances[arm_number] = enemy_create(enemy_joint_1, x + 11, y - 22, 0, arm_angle[arm_number], id, "Instances_Arms")
arm_distance[arm_number] = point_distance(0, 0, 11, -22)
with arm_instances[arm_number++] { // 3: side-front left
	invincible = INVINCIBLE_PARENTAL
	image_xscale = 0.8
}
arm_angle[arm_number] = point_direction(0, 0, -12, 21)
arm_instances[arm_number] = enemy_create(enemy_joint_1, x - 12, y + 21, 0, arm_angle[arm_number], id, "Instances_Arms")
arm_distance[arm_number] = point_distance(0, 0, -12, 21)
with arm_instances[arm_number++] { // 4: side-behind right
	invincible = INVINCIBLE_PARENTAL
	image_xscale = 0.5
	image_yscale = 0.65
}
arm_angle[arm_number] = point_direction(0, 0, -12, -22)
arm_instances[arm_number] = enemy_create(enemy_joint_1, x - 12, y - 22, 0, arm_angle[arm_number], id, "Instances_Arms")
arm_distance[arm_number] = point_distance(0, 0, -12, -22)
with arm_instances[arm_number++] { // 5: side-behind left
	invincible = INVINCIBLE_PARENTAL
	image_xscale = 0.5
	image_yscale = 0.65
}
arm_angle[arm_number] = point_direction(0, 0, -19, 10)
arm_instances[arm_number] = enemy_create(enemy_joint_1, x - 19, y + 10, 0, arm_angle[arm_number], id, "Instances_Arms")
arm_distance[arm_number] = point_distance(0, 0, -19, 10)
with arm_instances[arm_number++] { // 6: behind right
	invincible = INVINCIBLE_PARENTAL
	image_xscale = 0.2
	image_yscale = 1.1
}
arm_angle[arm_number] = point_direction(0, 0, -19, -11)
arm_instances[arm_number] = enemy_create(enemy_joint_1, x - 19, y - 11, 0, arm_angle[arm_number], id, "Instances_Arms")
arm_distance[arm_number] = point_distance(0, 0, -19, -11)
with arm_instances[arm_number++] { // 7: behind left
	invincible = INVINCIBLE_PARENTAL
	image_xscale = 0.2
	image_yscale = 1.1
}

x_target = [x, x]
x_border = 140
if type_create == RIGHT {
	x_target[0] = room_width - x_border
	x_target[1] = room_width - x_border + random_range(-2, 2) * 10
	x = room_width + x_border
} else if type_create == LEFT {
	x_target[0] = x_border
	x_target[1] = x_border + random_range(-20, 20)
	x = -x_border
}
image_angle = 90

motion_planning_init(enemy_callback_crab_roomout)
motion_planning_add(x, y, 0)
motion_planning_add(x_target[0], y - 30, seconds(0.8))
motion_planning_add(x_target[0], y - 30, seconds(4))
motion_planning_add(x_target[1], max(0, y - 100), seconds(1))
motion_planning_add(x_target[1], -64, seconds(4))

shot_direction = point_direction(x, y, global.px, global.py)
shot_speed = 5 + global.stage * 0.25
shot_count = 0
shot_progress = 0
shot_period_multi = seconds(0.14 - global.extreme * 0.08)
shot_period = seconds(2 - global.extreme * 0.5)
alarm[0] = seconds(1.5)

image_angle = 90
