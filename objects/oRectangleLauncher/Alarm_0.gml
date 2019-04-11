/// @description Shoting 1 x 4
if shot_count == 0
	shot_dir = point_direction(x, y, global.px, global.py)

if y < global.py + 64 {
	enemy_shot(x, y, shot_speed, shot_dir)
	enemy_play_shot()
}

if ++shot_count < 4 {
	alarm[0] = shot_period
} else {
	shot_count = 0
	alarm[0] = shot_period_continue
}
