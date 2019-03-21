/// @description Creation
name = "RECTANGLE"

enemy_arm_init(enemy_arm_rectangle_1, 4, 29, noone, 45)

vspeed = 20
speed_target = 1.5

shot_dir = 0
shot_speed = 4.5 + global.stage * 0.25
shot_count = 0

image_angle = random(360)

alarm[0] = 30
