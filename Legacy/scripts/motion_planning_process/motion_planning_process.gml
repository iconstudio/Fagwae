/// @description motion_planning_process([flag])
/// @function motion_planning_process
/// @param [flag] { boolean }
function motion_planning_process() {
	if argument_count == 1 and argument[0]
		return 0

	if planning_period <= planning_time++ {
		if planning_progress < planning_number {
			var plan = planning_list[planning_progress++]
			planning_x_begin = x
			planning_y_begin = y
			planning_x = plan[0]
			planning_y = plan[1]
			planning_period = plan[2]
			planning_easer = plan[3]
			planning_time = 0
			return 2
		} else if script_exists(planning_terminator) {
			planning_time = 0
			script_execute(planning_terminator)
			return 0
		}
	}

	direction = point_direction(x, y, planning_x, planning_y)
	var ratio = script_execute(planning_easer, planning_time / planning_period)
	x = lerp(planning_x_begin, planning_x, ratio)
	y = lerp(planning_y_begin, planning_y, ratio)

	return 1



}
