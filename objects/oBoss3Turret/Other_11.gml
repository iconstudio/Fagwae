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

pattern02_shot_time = 0
pattern02_shot_period = seconds(global.extreme ? 0.24 : 0.41)
pattern02_shot_speed = enemy_bullet_speed_fast

pattern03_start_time = 0
pattern03_start_period = seconds(0.7)
pattern03_angle = random(360)
pattern03_angular_time = 0
pattern03_angular_period = seconds(0.9)
pattern03_shot_time = 0
pattern03_shot_period = seconds(0.18)
pattern03_shot_speed = enemy_bullet_speed_slow

pattern04_shot_time = 0
pattern04_shot_period = seconds(0.15)
pattern04_shot_speed = global.extreme ? enemy_bullet_speed_faster * 1.5 : enemy_bullet_speed_faster

pattern05_shot_time = 0
pattern05_shot_period = seconds(0.06)
pattern05_shot_speed = enemy_bullet_speed_fast
pattern05_close_shot_speed = enemy_bullet_speed_fast * global.extreme ? 1.2 : 1

pattern07_shot_count = 0
pattern07_shot_time = -seconds(0.5)
pattern07_shot_period = seconds(global.extreme ? 0.2 : 0.23)
pattern07_shot_list = global.extreme ? [2, 5, 6, 4, 0, 0, 3, 0, 4, 10, 6] : [1, 7, 5, 0, 3, 0, 5, 2, 3, 8, 4]
pattern07_shot_angle_list = [10, 14, 26, 9, 30, -1, 9, 5, 9, 17, 11]

shot_direction = 270
shot_direction_target = 270
shot_direction_differ = 360 / seconds(1.6)
shot_lx = x
shot_ly = y
shot_speed = enemy_bullet_speed_faster
shot_period = seconds(0.4 - global.extreme * 0.1)
