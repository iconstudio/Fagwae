/// @description 

if pattern == 0 {
	if y > 400 { // next phase
		pattern = 1
		pattern_opened = false
	} else { // 확산탄
		if !pattern_opened { // only at first
			alarm[0] = seconds(0.17)
			pattern_opened = true
		}
	}
} else if pattern == 1 {
	if !pattern_opened { // only at first
			alarm[1] = seconds(0.43 - global.extreme * 0.17)
			pattern_opened = true
			shot_count = 0
		}
} else if pattern == 2 { // loop begin
	var tx = room_width * 0.5
	var ty = 180
	if abs(tx - x) < 4
		x = tx
	else if x < tx
		x += 3
	else if x > tx
		x -= 3

	if abs(ty - y) < 3
		y = ty
	else if y < ty
		y += 2
	else if y > ty
		y -= 2

	if !pattern_opened and pattern_await++ > pattern02_await {
		path_last = pathBoss2_1
		path_start(pathBoss2_1, pattern02_speed, path_action_continue, false)

		alarm[2] = 50 - global.extreme * 40
		pattern_opened = true
		pattern_await = 0
		shot_count = 0
	}
} else if pattern == 3 {
	var tx = room_width * 0.5
	var ty = 180
	if abs(tx - x) < 2
		x = tx
	else if x < tx
		x += 1.414
	else if x > tx
		x -= 1.414

	if abs(ty - y) < 3
		y = ty
	else if y < ty
		y += 2
	else if y > ty
		y -= 2

	if !pattern_opened and pattern_await++ > seconds(0.5) {
		alarm[3] = seconds(0.5)
		pattern_opened = true
		pattern_await = 0
		shot_count = 0
	}
} else if pattern == 4 {
	x = room_width * 0.5
	y = 180

	if !pattern_opened and pattern_await++ > seconds(0.5) {
		alarm[4] = seconds(0.5)
		pattern_opened = true
		pattern_await = 0
	}
	
	pattern04_count++
} else if pattern == 5 {
	if !pattern_opened and pattern_await++ > seconds(0.5) {
		alarm[5] = seconds(1)
		pattern_opened = true
		pattern_await = 0
	}

	if pattern_opened and pattern05_tempo >= 2 + (hp <= hp_max * 0.2)
		pattern05_count++
}

with glove_left
	pattern = other.pattern
with glove_right
	pattern = other.pattern
