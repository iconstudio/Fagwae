/// @description Pattern 5
if dead or (shot_count == 0 and pattern != 5)
	exit

var pd = point_direction(x, y, global.px, global.py)
if ++shot_count < 3 + global.extreme {
	enemy_shot(x, y, shot_speed + 2, pd)
	enemy_play_shot()

	alarm[5] = seconds(0.2 - global.extreme * 0.05)
} else if pattern == 5 {
	shot_count = 0
	alarm[5] = seconds(1.6)
}
