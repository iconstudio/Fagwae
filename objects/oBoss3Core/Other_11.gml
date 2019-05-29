/// @description Creation
enemy_arm_init(enemy_joint_2, 4, 19, enemy_callback_scout_arm_adjust)

velocity = room_width / seconds(2.3)

rotation = random(360)
rotate_begin = rotation
rotate_time = 0
rotate_period = seconds(1.3)
