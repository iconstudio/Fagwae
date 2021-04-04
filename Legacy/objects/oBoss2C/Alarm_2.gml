/// @description Pattern 3
if dead or pattern != 3
	exit

if type_create == LEFT {
	enemy_shot(x, y, shot_speed, 310)
	enemy_shot(x, y, shot_speed, 280)
} else if type_create == RIGHT {
	enemy_shot(x, y, shot_speed, 230)
	enemy_shot(x, y, shot_speed, 260)
}
enemy_play_shot()

alarm[2] = seconds(0.34 - global.extreme * 0.07)
