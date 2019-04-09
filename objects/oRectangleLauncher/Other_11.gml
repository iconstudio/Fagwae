/// @description Creation
name = "RECTANGLE"
vspeed = 20
vspeed_target = player_vspeed * 0.5

enemy_arm_init(enemy_arm_rectangle_1, 4, 29, noone, 45, "Instances_Arms_Below")

shot_dir = 0
shot_speed = room_width / seconds(3.1)
shot_count = 0
shot_period = seconds(0.2 - global.extreme * 0.15)
shot_period_continue = seconds(max(0.1, 1.6 - global.stage * 0.2 - global.extreme * 0.8))

image_angle = random(360)
alarm[0] = seconds(1)
