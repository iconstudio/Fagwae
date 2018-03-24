/// @description Pattern 3

if dead or (shot_count < 10 and pattern != 3)
	exit

if shot_count == 0
	enemy_shot(x, y, shot_speed, point_direction(x, y, global.px, global.py))

var i, lx, ly, lang
if global.extreme {
	for (i = 0; i < 2; ++i) {
		lang = 130 + shot_count * 10
		lx = x + lengthdir_x(20, lang)
		ly = y + lengthdir_y(20, lang)
		with enemy_shot(lx, ly, shot_speed, lang - 14)
			motion_add(direction + 90, 1)
		with enemy_shot(lx, ly, shot_speed, lang + 14)
			motion_add(direction + 90, 1)
	}

	for (i = 0; i < 2; ++i) {
		lang = 50 - shot_count * 10
		lx = x + lengthdir_x(20, lang)
		ly = y + lengthdir_y(20, lang)
		with enemy_shot(lx, ly, shot_speed, lang - 14)
			motion_add(direction - 90, 1)
		with enemy_shot(lx, ly, shot_speed, lang + 14)
			motion_add(direction - 90, 1)
	}
} else {

	for (i = 0; i < 2; ++i) {
		if hp > hp_max * 0.5
			lang = 290 + shot_count * 10
		else
			lang = 276 + shot_count * 10
		lx = x + lengthdir_x(20, lang)
		ly = y + lengthdir_y(20, lang)
		with enemy_shot(lx, ly, shot_speed, lang - 14)
			motion_add(direction + 90, 1)
		with enemy_shot(lx, ly, shot_speed, lang + 14)
			motion_add(direction + 90, 1)
	}

	for (i = 0; i < 2; ++i) {
		if hp > hp_max * 0.5
			lang = 250 - shot_count * 10
		else
			lang = 264 - shot_count * 10
		lx = x + lengthdir_x(20, lang)
		ly = y + lengthdir_y(20, lang)
	with enemy_shot(lx, ly, shot_speed, lang - 14)
			motion_add(direction - 90, 1)
		with enemy_shot(lx, ly, shot_speed, lang + 14)
			motion_add(direction - 90, 1)
	}
}

if ++shot_count < 20 {
	alarm[3] = 6 - global.extreme * 2
} else if pattern == 3 {
	shot_count = 0

	var target_count = 2
	if hp <= hp_max * 0.5
		target_count = 1
	if ++pattern03_count > target_count {
		pattern = 4
		pattern_opened = false
		pattern03_count = 0
		shot_count = 0

		if global.extreme {
			if global.px < x
				pattern04_picked = LEFT
			else
				pattern04_picked = RIGHT
		} else {
			pattern04_picked = choose(LEFT, RIGHT)
		}
		with glove_left {
			pattern = 4
			pattern_opened = false
		}
		with glove_right {
			pattern = 4
			pattern_opened = false
		}
	} else {
		alarm[3] = 20 - global.extreme * 8
	}
}
