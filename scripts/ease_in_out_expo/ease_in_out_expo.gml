/// @description ease_in_out_expo(delta)
/// @function ease_in_out_expo
/// @param delta { real }
if argument0 == 0
	return 0
else if argument0 == 1
	return 1

var t = argument0 * 2
if t < 1
	return 0.5 * power(2, 10 * (t - 1))

return 0.5 * (-power(2, -10 * (t - 1)) + 2)
