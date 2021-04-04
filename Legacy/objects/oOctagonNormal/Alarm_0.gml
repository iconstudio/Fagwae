/// @description Attacking
if shot_count < 4 {
	alarm[0] = shot_period
} else {
	shot_count = 0
	alarm[0] = shot_period_reset
}

if y >= global.py - 260 {
	shot_count = 0
	exit
}

var pd = point_direction(x, y, global.px, global.py)
if shot_count == 0 {
	enemy_shot(x, y, shot_speed, pd)
} else {
	enemy_shot(x, y, shot_speed, pd - shot_count * 12)
	enemy_shot(x, y, shot_speed, pd + shot_count * 12)
}
shot_count++
enemy_play_shot()
