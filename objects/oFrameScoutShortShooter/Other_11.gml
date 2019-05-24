/// @description Creation
enemy_arm_init(enemy_joint_2, 4, 19, enemy_callback_scout_arm_adjust)
image_xscale = 0.9
image_yscale = image_xscale

motion_planning_init(enemy_callback_disappear)
motion_planning_add(x, -64, 0)
motion_planning_add(x, 320, seconds(1.8))
motion_planning_add(x, 320, seconds(1))
motion_planning_add(x, 1060, seconds(3))

rotation = random(360)
rotate_begin = rotation
rotate_time = 0
rotate_period = seconds(1.3)

shot_speed = enemy_bullet_speed_faster
alarm[0] = seconds(2.3)
