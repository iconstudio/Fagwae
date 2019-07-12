/// @description Creation
name = "OCTAGON"
vspeed = player_vspeed * 0.75

shot_phase = -1
shot_speed = enemy_bullet_speed_medium
shot_count = 0
shot_period = seconds(max(0.13, 0.21 - global.stage * 0.05))
shot_period_continue = global.extreme ? seconds(max(0.13, 0.3 - global.stage * 0.06) + 0.2) : seconds(max(0.18, 0.3 - global.stage * 0.06) + 0.2)
shot_period_reset1 = seconds(max(1, 1.8 - global.stage * 0.3))
shot_period_multi = global.extreme ? seconds(max(0.2, 0.35 - global.stage * 0.06)) : seconds(max(0.3, 0.45 - global.stage * 0.04))
shot_period_reset2 = seconds(max(0.333, 1 - global.stage * 0.07))

