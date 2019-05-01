/// @description Creation
name = "ARM"

shot_speed = enemy_bullet_speed_medium
shot_period = global.extreme ? seconds(max(0.05, 0.2 - global.stage * 0.333)) : seconds(max(0.1, 0.4 - global.stage * 1))
alarm[0] = seconds(0.5)
