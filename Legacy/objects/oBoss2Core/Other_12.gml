/// @description Update
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
	if abs(tx - x) < hspeed_value
		x = tx
	else if x < tx
		x += hspeed_value
	else if x > tx
		x -= hspeed_value

	if abs(ty - y) < vspeed_value
		y = ty
	else if y < ty
		y += vspeed_value
	else if y > ty
		y -= vspeed_value

	if !pattern_opened and pattern_await++ > pattern02_await {
		path_last = pathBoss2_1
		path_start(pathBoss2_1, pattern02_speed, path_action_continue, false)

		alarm[2] = seconds(1)
		pattern_opened = true
		pattern_await = 0
		shot_count = 0
	}
} else if pattern == 3 {
	var tx = room_width * 0.5
	var ty = 180
	if abs(tx - x) < hspeed_value
		x = tx
	else if x < tx
		x += hspeed_value
	else if tx < x
		x -= hspeed_value

	if abs(ty - y) < vspeed_value
		y = ty
	else if y < ty
		y += vspeed_value
	else if ty < y
		y -= vspeed_value

	if !pattern_opened and pattern_await++ > seconds(0.5) {
		alarm[3] = seconds(0.8)
		pattern_opened = true
		pattern_await = 0
		shot_count = 0
	}
} else if pattern == 4 {
	x = room_width * 0.5
	y = 180

	if !pattern_opened and pattern_await++ > seconds(0.5) {
		alarm[4] = seconds(0.8)
		pattern_opened = true
		pattern_await = 0
	}

	pattern04_count++
} else if pattern == 5 {
	if !pattern_opened and seconds(0.5) < pattern_await++ {
		alarm[5] = seconds(1)
		pattern_opened = true
		pattern_await = 0
	}

	if pattern_opened and 2 + (hp <= hp_max * 0.2) < pattern05_tempo
		pattern05_count++
}

with glove_left
	pattern = other.pattern
with glove_right
	pattern = other.pattern

enemy_arm_fix(90)

event_inherited()
