/// @description Creation

vspeed = 10

enemy_arm_init(enemy_arm_rectangle_1, 4, 19)

shot_dir = 0
shot_speed = 4.5 + global.stage / 4
shot_count = 0

image_angle = random(360)

alarm[0] = 30
