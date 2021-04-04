/// @description get_rotation_next(current, target, addition)
/// @function get_rotation_next
/// @param current { real }
/// @param target { real }
/// @param addition { real }
function get_rotation_next(argument0, argument1, argument2) {
	return clamp(-angle_difference(argument0, argument1), -argument2, argument2)



}
