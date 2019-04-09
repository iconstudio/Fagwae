/// @description Attacking
if abool { // straight
	var scnt = round(10 - arm_count * 0.5) + global.extreme * 4
	var ddir = 360 / scnt
	for (var i = 0; i < scnt; ++i)
		enemy_shot(x, y, shot_speed_green, move_angle * 19 + ddir * i, oEnemyBullet2)
} else { // reverse
	var scnt = round(10 - arm_count * 0.5) + global.extreme * 4
	var ddir = 360 / scnt
	for (var i = 0; i < scnt; ++i)
		enemy_shot(x, y, shot_speed, -move_angle * 19 + ddir * i + 180)
}
enemy_play_shot()

abool = !abool

alarm[1] = shot_period
