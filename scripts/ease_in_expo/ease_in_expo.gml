/// @description ease_in_expo(delta)
/// @function ease_in_expo
/// @param delta { real }
if argument0 == 0
	return 0

return power(2, 10 * (argument0 - 1))
