/// @description Creation
name = "OCTAGON"
vspeed = player_vspeed * 0.75

shot_phase = -1
shot_speed = enemy_bullet_speed_medium
shot_count = 0
shot_period = seconds(0.21 - global.stage * 0.05)
if global.extreme
	shot_period_continue = seconds(max(0.13, 0.3 - global.stage * 0.06) + 0.2)
else
	shot_period_continue = seconds(max(0.18, 0.3 - global.stage * 0.06) + 0.2)
shot_period_reset = seconds(1.6 - global.stage * 0.4)
