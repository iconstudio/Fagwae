/// @description area_trigger_push(type, time_delay, [data], [other], [x], [y])
/// @function area_trigger_push
/// @param type { integer }
/// @param time_delay { real }
/// @param [data] { all }
/// @param [other] { all }
/// @param [x] { real }
/// @param [y] { real }

var data = undefined, dother = undefined, cx = undefined, cy = undefined

if argument_count > 2 {
	data = argument[2]
	if argument_count > 3 {
		dother = argument[3]
		if argument_count > 4 {
			cx = argument[4]
			if argument_count > 5
				cy = argument[5]
		}
	}
}

var pusher = array_create(6)
pusher[0] = argument[0]
pusher[1] = argument[1]
pusher[2] = data
pusher[3] = dother
pusher[4] = cx
pusher[5] = cy
trigger_push[trigger_size++] = pusher
