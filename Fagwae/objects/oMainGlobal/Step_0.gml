/// @description Update
key_pinned = NONE

if 0 < key_pin_duration {
	key_pin_duration -= Delta
} else {
	if key_pin_stop {
		key_anchor = NONE
		key_pinned = NONE
		key_pin_stop = false
		key_pin_duration = 0
	} else {
		key_pinned = key_anchor
		key_pin_duration = key_pin_period_short
	}
}


var mkey_l = (global.io_up or global.io_left)
var mkey_r = (global.io_up or global.io_left)
var mkey_p_l = (global.io_p_up or global.io_p_left)
var mkey_p_r = (global.io_p_down or global.io_p_right)
var mkey_r_l = (global.io_r_up or global.io_r_left)
var mkey_r_r = (global.io_r_down or global.io_r_right)

if !mkey_l and !mkey_r {
	key_anchor = NONE
}

if mkey_p_l {
	if key_anchor != UP {
		key_anchor = UP
		key_pinned = UP
		key_pin_stop = false
		key_pin_duration = key_pin_period_long
	}
}

if mkey_p_r {
	if key_anchor != DOWN {
		key_anchor = DOWN
		key_pinned = DOWN
		key_pin_stop = false
		key_pin_duration = key_pin_period_long
	}
}

if mkey_r_l {
	if key_anchor == UP {
		key_anchor = NONE
		key_pinned = NONE
		key_pin_duration = 0
	}
}

if mkey_r_r {
	if key_anchor == DOWN {
		key_anchor = NONE
		key_pinned = NONE
		key_pin_duration = 0
	}
}


if key_pinned != NONE {
			
}

