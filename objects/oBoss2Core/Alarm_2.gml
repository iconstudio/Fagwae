/// @description Pattern 2

var pd = point_direction(x, y, global.px, global.py)

if dead or (shot_count == 0 and pattern != 2) {
	enemy_shot(x, y, shot_speed, pd - 10)
	enemy_shot(x, y, shot_speed, pd)
	enemy_shot(x, y, shot_speed, pd + 10)
	exit
}

if hp < hp_max * 0.5
	enemy_shot(x, y, shot_speed, pd + lengthdir_y(20, hp))
if global.extreme
	enemy_shot(x, y, shot_speed, pd)
else
	enemy_shot(x, y, shot_speed * 0.75, pd)

if ++shot_count < 2 + round((1 - hp / hp_max) * 2) {
	if global.extreme
		alarm[2] = 4
	else
		alarm[2] = 9
} else if pattern == 2 {
	shot_count = 0
	if global.extreme
		alarm[2] = 60
	else
		alarm[2] = 90
}
