/// @description Creation
//vspeed = area_vspeed
angle_target = 75 + random(30)
angle_target_previous = angle_target
angle_target_gap = 0
angle_previous = angle_target
image_angle = angle_target
angle_time = 0
angle_period = seconds(2)
roomborder_left = 64
roomborder_right = room_width - 64

MODE_STOP = 0
MODE_MOVE = 1 // but also its arms will attack
MODE_ATTACK = 2 // it will not move, just hold
MODE_SPREAD = 3 // stops and spreads many bullets
MODE_OUT = 99
mode = MODE_STOP

if y <= 0
	begin_time = seconds(5)
else
	begin_time = seconds(0.1)
end_time = seconds(20)

move_distance = 80
move_count = 0
move_count_max = 0
move_once_time = 0
move_once_period_default = seconds(1)
move_once_period = move_once_period_default
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
out_start_y = y
out_target_y = -130

enemy_arm_init(enemy_arm_crawler_terminal, 2, 40)
