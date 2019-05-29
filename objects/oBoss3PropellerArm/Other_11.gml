/// @description Creation
image_xscale = 0.55
image_yscale = 0.5

enemy_arm_init(enemy_joint_2, 3, 0, enemy_callback_propeller_adjust)

rotation = random(360)
rotate_begin = rotation
rotate_time = 0
rotate_period = seconds(0.7)

hurt_upper_ratio = 1
invincible = INVINCIBLE_PARENTAL
