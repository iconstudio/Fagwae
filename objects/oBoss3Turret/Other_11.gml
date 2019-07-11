/// @description Creation
name = "Turret"

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

shot_direction = 270
shot_speed = enemy_bullet_speed_faster
shot_period = seconds(0.4 - global.extreme * 0.1)
