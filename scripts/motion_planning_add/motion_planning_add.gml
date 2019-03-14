/// @description motion_planning_add(x, y, time)
/// @function motion_planning_add
/// @param x { real }
/// @param y { real }
/// @param time { real }
planning_list[planning_number] = [argument0, argument1, argument2]
if planning_number == 0 {
	planning_x_begin = argument0
	planning_y_begin = argument1
	planning_x = argument0
	planning_y = argument1
	planning_period = argument2
}

return planning_number++
