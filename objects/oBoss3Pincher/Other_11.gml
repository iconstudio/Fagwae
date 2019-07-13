/// @description Creation
image_yscale = 1.4

hurt_upper_ratio = 0.3
invincible = INVINCIBLE_PARENTAL

pattern = 0
pattern_opened = false

pattern00_shot_time = 0
pattern00_shot_period = seconds(0.6)
pattern00_shot_speed = enemy_bullet_speed_faster

pattern01_shot1_time = 0
pattern01_shot1_period = seconds(global.extreme ? 0.06 : 0.09)
pattern01_shot1_speed = enemy_bullet_speed_medium
pattern01_shot1_green_speed = enemy_bullet_speed_medium * 1.3
pattern01_shot2_time = 0
pattern01_shot2_period = seconds(global.extreme ? 0.05 : 0.07)
pattern01_shot2_snipe_speed = enemy_bullet_speed_fast * global.extreme ? 2.3 : 2
pattern01_shot2_speed = enemy_bullet_speed_slower
pattern01_shot2_green_speed = enemy_bullet_speed_medium
pattern01_shot3_speed = enemy_bullet_speed_slowest

pattern02_shot_time = 0
pattern02_shot_period = seconds(global.extreme ? 0.5 : 0.95)
pattern02_shot_period_min = seconds(global.extreme ? 0.1 : 0.3)
pattern02_shot_period_max = pattern02_shot_period
pattern02_shot_speed = enemy_bullet_speed_slower
pattern02_shot_speed_min = enemy_bullet_speed_fast
pattern02_shot_speed_max = pattern02_shot_speed

pattern03_shot_count = 0
pattern03_shot_time = 0
pattern03_shot_period = seconds(0.2)
pattern03_shot_speed = enemy_bullet_speed_faster * 1.4
