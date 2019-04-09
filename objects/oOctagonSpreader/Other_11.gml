/// @description Creation
name = "SPREADING OCTAGON"
appear_distance = max(140, 150 - ystart)
appear_time = 0
appear_period = seconds(0.7)
accel_value = global.game_velocity[2] + 1// - (appear_distance / appear_period)
accel_time = 0
accel_period = seconds(1.7)
enemy_arm_init(enemy_arm_spread_1, 5, 20)

shot_mode = 0
shot_count = 0
shot_period = max(1, seconds(0.1 - global.stage * 0.02 - global.extreme * 0.03))
shot_period_continue = max(1, seconds(0.78 - global.stage * 0.04 - global.extreme * 0.03))

shot_rotation = 0
rotate_begin = random(360)
rotate_time = 0
rotate_period = seconds(4)
