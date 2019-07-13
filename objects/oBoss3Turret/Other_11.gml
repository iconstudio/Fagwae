/// @description Creation
name = "Turret"
arm_angle_fixed = 0

untargetable = true

pattern = 0
pattern_opened = false

pattern00_shot_count = 0
pattern00_shot_time = -seconds(3.4)
pattern00_shot_period = seconds(global.extreme ? 0.17 : 0.24)
pattern00_shot_list = global.extreme ? [4, 5, 8, 8, 3] : [2, 3, 6, 4, 1]
pattern00_shot_angle_list = [15, 14, 10, 8, 14]
pattern00_shot_second_count = 0
pattern00_shot_second_list = global.extreme ? [3, 5, 3] : [1, 3, 3]

pattern01_shot_count = 0
pattern01_shot_time = -seconds(3.45)
pattern01_shot_period = seconds(0.2)
pattern01_shot_list = global.extreme ? [3, 5, 4, 1] : [2, 3, 4, 0]
pattern01_shot_angle_list = [15, 12, 19, 0]
pattern01_shot_speed = enemy_bullet_speed_slowest

pattern03_start_time = 0
pattern03_start_period = seconds(0.7)
pattern03_angle = random(360)
pattern03_angular_time = 0
pattern03_angular_period = seconds(0.9)
pattern03_shot_time = 0
pattern03_shot_period = seconds(0.18)
pattern03_shot_speed = enemy_bullet_speed_slow

pattern04_shot_time = 0
pattern04_shot_period = seconds(0.3)
pattern04_shot_speed = global.extreme ? enemy_bullet_speed_faster * 1.5 : enemy_bullet_speed_faster

shot_direction = 270
shot_direction_target = 270
shot_lx = x
shot_ly = y
shot_speed = enemy_bullet_speed_faster
shot_period = seconds(0.4 - global.extreme * 0.1)
