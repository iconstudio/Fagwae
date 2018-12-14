/// @description Creation

enemy_arm_init(enemy_arm_rectangle_2, 4, 31)

arm_instances = array_create(8)
arm_angle = array_create(8)
arm_number = 0
arm_instances[arm_number] = enemy_create(enemy_joint_1, x + 16, y + 12)
arm_angle[arm_number] = point_direction(0, 0, 16, 12)
with arm_instances[arm_number++] { // 0: front right
	invincible = true
	image_xscale = 0.9
}
arm_instances[arm_number] = enemy_create(enemy_joint_1, x + 16, y - 13)
arm_angle[arm_number] = point_direction(0, 0, 16, -13)
with arm_instances[arm_number++] { // 1: front left
	invincible = true
	image_xscale = 0.9
}
arm_instances[arm_number] = enemy_create(enemy_joint_1, x + 11, y + 21)
arm_angle[arm_number] = point_direction(0, 0, 11, 21)
with arm_instances[arm_number++] { // 2: side-front right
	invincible = true
	image_xscale = 0.8
}
arm_instances[arm_number] = enemy_create(enemy_joint_1, x + 11, y - 22)
arm_angle[arm_number] = point_direction(0, 0, 11, -22)
with arm_instances[arm_number++] { // 3: side-front left
	invincible = true
	image_xscale = 0.8
}
arm_instances[arm_number] = enemy_create(enemy_joint_1, x - 12, y + 21)
arm_angle[arm_number] = point_direction(0, 0, -12, 21)
with arm_instances[arm_number++] { // 4: side-behind right
	invincible = true
	image_xscale = 0.5
	image_yscale = 0.65
}
arm_instances[arm_number] = enemy_create(enemy_joint_1, x - 12, y - 22)
arm_angle[arm_number] = point_direction(0, 0, -12, -22)
with arm_instances[arm_number++] { // 5: side-behind left
	invincible = true
	image_xscale = 0.5
	image_yscale = 0.65
}
arm_instances[arm_number] = enemy_create(enemy_joint_1, x - 19, y + 10)
arm_angle[arm_number] = point_direction(0, 0, -19, 10)
with arm_instances[arm_number++] { // 6: behind right
	invincible = true
	image_xscale = 0.2
	image_yscale = 1.1
}
arm_instances[arm_number] = enemy_create(enemy_joint_1, x - 19, y - 11)
arm_angle[arm_number] = point_direction(0, 0, -19, -11)
with arm_instances[arm_number++] { // 7: behind left
	invincible = true
	image_xscale = 0.2
	image_yscale = 1.1
}

mover = path_add()
path_set_closed(mover, false)
path_set_precision(mover, 8)
path_add_point(mover, x, y, 100)

x_target = x
x_border = 96
if type_create == RIGHT {
	x_target = room_width - x_border
	x = room_width + 100
} else if type_create == LEFT {
	x_target = x_border
	x = -100
}
moving_mode = 2
moving_count = 0

shot_dir = 0
shot_speed = 3 + global.stage * 0.333
shot_count = 0
shot_mode = 0

image_angle = 90

if y <= 10
	instance_destroy()
