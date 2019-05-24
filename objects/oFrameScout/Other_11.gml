/// @description Creation
enemy_arm_init(enemy_joint_2, 4, 20)

velocity = room_width / seconds(2)
if path_exists(type_create)
	path_start(type_create, velocity, path_action_stop, true)
else
	vspeed = velocity

rotation = random(360)
rotate_begin = rotation
rotate_time = 0
rotate_period = seconds(2.7)
