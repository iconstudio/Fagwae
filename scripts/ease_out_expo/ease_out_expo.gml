/// @description ease_out_expo(delta)
/// @function ease_out_expo
/// @param delta { real }
if argument0 == 1
	return 1

return -power(2, -10 * argument0) + 1
