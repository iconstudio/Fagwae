/// @description Update

if begin_y != y
	y += (begin_y - y) * 0.2

var _sec = 60
if dmode == 0 {
	if time_current < _sec {
		rpush = time_current / _sec
	} else {
		rpush = 1
	}
	
	if time_current > _sec * 4 {
		dmode = 1
		time_current = 0
	}
} else {
	if time_current < _sec {
		rpush =  1 - time_current / _sec
	} else {
		rpush = 0
		
		with callback {
			callto = other.id
			event_user(1)
		}
		instance_destroy()
	}
}

time_current += 1
