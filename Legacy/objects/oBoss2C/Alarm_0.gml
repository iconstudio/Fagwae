/// @description Pattern 1
enemy_shot(x, y, shot_speed * 1.5, 270, oEnemyBullet2)
enemy_play_shot()

if shot_count++ < 2
	alarm[0] = seconds(0.15)
