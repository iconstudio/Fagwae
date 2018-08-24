/// @description Pattern 1

enemy_shot(x, y, shot_speed, 270, oEnemyBullet2)
audio_play_sound(soundShotEnemy, 0, false)

if shot_count++ < 2
	alarm[0] = 10
