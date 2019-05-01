/// @description Creation
name = "OCTAGON"
vspeed = 6

shot_speed = enemy_bullet_speed_medium
shot_count = 0
shot_period = global.extreme ? seconds(max(0.05, 0.12 - global.stage * 0.04)) : seconds(max(0.1, 0.2 - global.stage * 0.05))
shot_period_reset = global.extreme ? seconds(max(0.6, 1.4 - global.stage * 0.2) + 0.2) : seconds(max(1, 1.2 - global.stage * 0.4) + 0.3)
alarm[0] = seconds(0.7)
