/// @description Update
if !parent.failsafe
	exit

if shot_time < shot_period {
	shot_time++
} else {
	if irandom(parent.failsafe_ratio * ((global.extreme ? 5 : 10) + max(global.py - parent.y - y, 0))) == 0 {
		enemy_shot(x, y, shot_speed, point_direction(x, y, global.px, global.py))
		if !audio_is_playing(soundShotEnemy)
			enemy_play_shot()

		shot_time = 0
	}
}
