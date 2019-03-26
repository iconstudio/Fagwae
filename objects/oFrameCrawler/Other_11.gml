/// @description Creation
vspeed = area_vspeed
image_angle = 75

MODE_STOP = 0
MODE_MOVE = 1 // but also its arms will attack
MODE_ATTACK = 2 // it will not move, just hold
MODE_SPREAD = 3 // stops and spreads many bullets
MODE_OUT = 99
mode = MODE_STOP

begin_time = seconds(0.1)
end_time = seconds(20)

move_distance = 180
move_count = 0
move_count_max = 0
move_once_time = 0
move_once_period_default = seconds(1)
move_once_period_slow = move_once_period_default * 2
move_once_period = move_once_period_default
move_once_atomic = floor(100 / move_once_period) * 0.01
move_delay_time = 0
move_delay_period = seconds(0.2)
move_startx = x
move_starty = y

attack_time = 0
attack_period = seconds(3)

spread_time = 0
spread_period = seconds(2) + seconds(1) * global.extreme

out_time = 0
out_period_max = seconds(8)
out_period = out_period_max
out_target_y = -130

enemy_arm_init(enemy_arm_crawler_terminal, 2, 40)
