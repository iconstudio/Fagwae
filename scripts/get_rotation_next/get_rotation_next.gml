/// @description get_rotation_next(current, target, addition)
/// @function get_rotation_next
/// @param current { real }
/// @param target { real }
/// @param addition { real }
/*
var angle = argument1 - argument0
if angle > 180
	argument0 += 360
else if angle < -180
	argument0 -= 360

angle = argument1 - argument0

if abs(angle) < argument2
	return angle
else
	return sign(angle) * argument2
*/

return clamp(angle_difference(argument0, argument1), -argument2, argument2)
