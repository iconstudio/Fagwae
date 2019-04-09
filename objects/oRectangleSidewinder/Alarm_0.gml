/// @description Shooting 3-1-1
if shot_count == 0 {
	shot_dir = point_direction(x, y, global.px, global.py)
	enemy_shot(x, y, shot_speed, shot_dir - 23)
	enemy_shot(x, y, shot_speed, shot_dir + 23)
}
enemy_shot(x, y, shot_speed, shot_dir)
enemy_play_shot()

if ++shot_count < 3 {
	alarm[0] = shot_period
} else {
	shot_count = 0
	alarm[0] = shot_period_continue
}
