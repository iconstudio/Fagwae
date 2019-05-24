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

shot_count = 0
shot_speed = enemy_bullet_speed_slower
shot_period = seconds(1.2 - global.stage * 0.06 - global.extreme * 0.2)
alarm[0] = seconds(1.5 - global.extreme * 0.4)
