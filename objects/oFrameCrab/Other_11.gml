/// @description Creation
arm_instances = array_create(8)
arm_angle = array_create(8)
arm_distance = array_create(8)
arm_number = 0

arm_angle[arm_number] = point_direction(0, 0, 16, 12)
arm_instances[arm_number] = enemy_create(enemy_joint_1, x + 16, y + 12, 0, arm_angle[arm_number], id, "Instances_Arms")
arm_distance[arm_number] = point_distance(0, 0, 16, 12)
with arm_instances[arm_number++] { // 0: front right
	invincible = true
	image_xscale = 0.2
}
arm_angle[arm_number] = point_direction(0, 0, 16, -13)
arm_instances[arm_number] = enemy_create(enemy_joint_1, x + 16, y - 13, 0, arm_angle[arm_number], id, "Instances_Arms")
arm_distance[arm_number] = point_distance(0, 0, 16, -13)
with arm_instances[arm_number++] { // 1: front left
	invincible = true
	image_xscale = 0.2
}
arm_angle[arm_number] = point_direction(0, 0, 11, 21)
arm_instances[arm_number] = enemy_create(enemy_joint_1, x + 11, y + 21, 0, arm_angle[arm_number], id, "Instances_Arms")
arm_distance[arm_number] = point_distance(0, 0, 11, 21)
with arm_instances[arm_number++] { // 2: side-front right
	invincible = true
	image_xscale = 0.8
}
arm_angle[arm_number] = point_direction(0, 0, 11, -22)
arm_instances[arm_number] = enemy_create(enemy_joint_1, x + 11, y - 22, 0, arm_angle[arm_number], id, "Instances_Arms")
arm_distance[arm_number] = point_distance(0, 0, 11, -22)
with arm_instances[arm_number++] { // 3: side-front left
	invincible = true
	image_xscale = 0.8
}
arm_angle[arm_number] = point_direction(0, 0, -12, 21)
arm_instances[arm_number] = enemy_create(enemy_joint_1, x - 12, y + 21, 0, arm_angle[arm_number], id, "Instances_Arms")
arm_distance[arm_number] = point_distance(0, 0, -12, 21)
with arm_instances[arm_number++] { // 4: side-behind right
	invincible = true
	image_xscale = 0.5
	image_yscale = 0.65
}
arm_angle[arm_number] = point_direction(0, 0, -12, -22)
arm_instances[arm_number] = enemy_create(enemy_joint_1, x - 12, y - 22, 0, arm_angle[arm_number], id, "Instances_Arms")
arm_distance[arm_number] = point_distance(0, 0, -12, -22)
with arm_instances[arm_number++] { // 5: side-behind left
	invincible = true
	image_xscale = 0.5
	image_yscale = 0.65
}
arm_angle[arm_number] = point_direction(0, 0, -19, 10)
arm_instances[arm_number] = enemy_create(enemy_joint_1, x - 19, y + 10, 0, arm_angle[arm_number], id, "Instances_Arms")
arm_distance[arm_number] = point_distance(0, 0, -19, 10)
with arm_instances[arm_number++] { // 6: behind right
	invincible = true
	image_xscale = 0.2
	image_yscale = 1.1
}
arm_angle[arm_number] = point_direction(0, 0, -19, -11)
arm_instances[arm_number] = enemy_create(enemy_joint_1, x - 19, y - 11, 0, arm_angle[arm_number], id, "Instances_Arms")
arm_distance[arm_number] = point_distance(0, 0, -19, -11)
with arm_instances[arm_number++] { // 7: behind left
	invincible = true
	image_xscale = 0.2
	image_yscale = 1.1
}

mover = path_add()
path_set_closed(mover, false)
path_set_precision(mover, 8)
x_target = x
x_border = 96
if type_create == RIGHT {
	x_target = room_width - x_border
	x = room_width + 100
} else if type_create == LEFT {
	x_target = x_border
	x = -100
}
path_add_point(mover, x, y, 100)
path_add_point(mover, (x_target + x) * 0.5, y - 30, 70)
path_add_point(mover, x_target, y - 100, 30)
path_add_point(mover, x_target, y - 200, 50)
path_add_point(mover, x_target, max(0, y - 400), 80)
path_add_point(mover, x_target, -64, 100)
path_start(mover, 4, path_action_stop, true)

shot_dir = point_direction(x, y, global.px, global.py)
shot_speed = 3 + global.stage * 0.333
shot_count = 0
shot_mode = 0

image_angle = 90
