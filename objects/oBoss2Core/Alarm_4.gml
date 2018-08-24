/// @description Pattern 4

if dead or (shot_count == 0 and pattern != 4)
	exit

var pd = point_direction(x, y, global.px, global.py)

if ++shot_count < 4 {
	var counter = pattern04_list[shot_count - 1]
	var shot_angular = pd - (counter - 1) * 4.9

	for (var i = 0; i < counter; ++i)
		enemy_shot(x, y, shot_speed, shot_angular + i * 9)
	audio_play_sound(soundShotEnemy, 0, false)

	alarm[4] = 6 - global.extreme * 2
} else if pattern == 4 {
	if pattern04_count > 120 {
		path_last = pathBoss2_2
		path_start(pathBoss2_2, 1, path_action_continue, false)

		pattern = 5
		pattern_opened = false
		pattern04_count = 0
	}

	shot_count = 0
	alarm[4] = 80
}
