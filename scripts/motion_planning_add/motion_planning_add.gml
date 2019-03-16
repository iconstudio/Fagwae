/// @description motion_planning_add(x, y, time, [easer])
/// @function motion_planning_add
/// @param x { real }
/// @param y { real }
/// @param time { real }
/// @param [easer] { script }
if planning_number == 0 {
	planning_x_begin = argument[0]
	planning_y_begin = argument[1]
	planning_x = argument[0]
	planning_y = argument[1]
	planning_period = argument[2]
	if argument_count > 3
		planning_easer = argument[3]
}

if argument_count > 3
	planning_list[planning_number] = [argument[0], argument[1], argument[2], argument[3]]
else
	planning_list[planning_number] = [argument[0], argument[1], argument[2], ease_linear]

return planning_number++
