/// @description Pattern 5

if dead or (shot_count == 0 and pattern != 5) {
	pattern05_position = 0
	exit
}

if shot_count == 0 {
	enemy_shot(x, y, shot_speed * 0.75, 40, oEnemyBullet2)
	enemy_shot(x, y, shot_speed * 0.75, 140, oEnemyBullet2)
}

if shot_count < 4 {
	if shot_count & 1 { 
		enemy_shot(x, y, shot_speed * 0.75, 20)
		enemy_shot(x, y, shot_speed * 0.75, 160)
	} else {
		enemy_shot(x, y, shot_speed * 0.75, 300, oEnemyBullet2)
		enemy_shot(x, y, shot_speed * 0.75, 240, oEnemyBullet2)
	}
} else {
	var i, lx, ly, lang
	for (i = 0; i < 4; ++i) {
		lang = 270 + lengthdir_y(50, i * 167 + pattern05_position * 2)
		lx = x + lengthdir_x(12, lang)
		ly = y + lengthdir_y(12, lang)
		enemy_shot(lx, ly, shot_speed, lang)
	}
}

var i, lx, ly, lang
for (i = 0; i < max(2, 5 - shot_count); ++i) {
	lang = 270 + lengthdir_y(40, i * 66 + pattern05_position)
	lx = x + lengthdir_x(12, lang)
	ly = y + lengthdir_y(12, lang)
	
	enemy_shot(lx, ly, shot_speed * 0.85, lang)
	enemy_shot(lx, ly, shot_speed * 0.85, lang)
}

if ++shot_count < 4 + global.extreme + (parent.hp <= parent.hp_max * 0.333) {
	alarm[4] = 10 - global.extreme
} else if pattern == 5 {
	shot_count = 0
	alarm[4] = 80 - global.extreme * 30
}
