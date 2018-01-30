/// @description get_rotation_next(value)
/// @function get_rotation_next
/// @param value { real }

var angle = argument1 - argument0
if angle > 180
	argument0 += 360
else if angle < -180
	argument0 -= 360

angle = argument1 - argument0

if abs(angle) < argument2
	return angle
else
	return sign(angle) * argument2;
