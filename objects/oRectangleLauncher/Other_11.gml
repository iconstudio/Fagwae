/// @description Creation

vspeed = 20
speed_target = 1.5

enemy_arm_init(enemy_arm_rectangle_1, 4, 22, noone, 45)

shot_dir = 0
shot_speed = 4.5 + global.stage / 4
shot_count = 0

image_angle = random(360)

alarm[0] = 30
