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

	rotataion += 4
} else if pattern == 1 {
	if !pattern_opened { // only at first
			alarm[1] = 20 - global.extreme * 10
			pattern_opened = true
			shot_count = 0
		}
}

with glove_left
	pattern = other.pattern
with glove_right
	pattern = other.pattern
