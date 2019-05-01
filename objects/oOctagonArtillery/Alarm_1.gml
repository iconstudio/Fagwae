/// @description Shooting 1-1
var dir = point_direction(x, y, global.px, global.py)
enemy_shot(x, y, shot_speed, dir)
if shot_count == 1 and global.extreme {
	enemy_shot(x, y, shot_speed, dir - 25)
	enemy_shot(x, y, shot_speed, dir + 25)
}

if ++shot_count < 3 {
	alarm[1] = shot_period2
} else {
	shot_count = 0

	alarm[0] = seconds(1.9)
}
