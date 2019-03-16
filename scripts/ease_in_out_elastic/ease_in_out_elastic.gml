/// @description ease_in_out_elastic(delta)
/// @function ease_in_out_elastic
/// @param delta { real }
if argument0 == 0
	return 0
else if argument0 == 1
	return 1

var p = 0.3
var s = p * 0.25
var t = argument0 * 2 - 1
if t < 0
	return -0.5 * (power(2, 10 * t) * sin((t - s) * (2 * pi) / p))
return power(2, -10 * t) * sin((t - s) * (2 * pi) / p) * 0.5 + 1
