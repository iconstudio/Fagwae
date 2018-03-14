/// @description 

if pattern == 0 {
	if y > 400 { // next phase
		pattern = 1
		pattern_opened = false
	} else { // 확산탄
		if !pattern_opened { // only at first
			alarm[0] = 10
			pattern_opened = true
		}
	}
} else if pattern == 1 {
	if !pattern_opened { // only at first
			alarm[1] = 20 - global.extreme * 10
			pattern_opened = true
			shot_count = 0
		}
} else if pattern == 2 { // loop begin
	if !pattern_opened and pattern_await++ > 70 - global.extreme * 30 {
		path_last = pathBoss2_1
		path_start(pathBoss2_1, 2, path_action_continue, false)

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

	if !pattern_opened and pattern_await++ > 30 {
		alarm[3] = point_distance(x, y, tx, ty) + 1
		pattern_opened = true
		pattern_await = 0
		shot_count = 0
	}
}

with glove_left
	pattern = other.pattern
with glove_right
	pattern = other.pattern
