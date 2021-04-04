/// @description Creation
untargetable = true

shot_speed = enemy_bullet_speed_slowest * 1.1
shot_direction = 90
shot_period = seconds(max(2 - global.extreme * 0.5, 2.66 - global.stage * 0.094))
alarm[0] = seconds(3)
