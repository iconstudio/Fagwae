/// @description motion_planning_add(x, y, time, [easer])
/// @function motion_planning_add
/// @param x { real }
/// @param y { real }
/// @param time { real }
/// @param [easer] { script }
function motion_planning_add() {
	var planning_argument_easer = 3 < argument_count ? argument[3] : ease_linear
	if planning_number == 0 {
		planning_x_begin = argument[0]
		planning_y_begin = argument[1]
		planning_x = argument[0]
		planning_y = argument[1]
		planning_period = argument[2]
		planning_easer = planning_argument_easer
	}
	planning_list[planning_number] = [argument[0], argument[1], argument[2], planning_argument_easer]

	return planning_number++



}
