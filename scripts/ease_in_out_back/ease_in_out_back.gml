/// @description ease_in_out_back(delta)
/// @function ease_in_out_back
/// @param delta { real }
var s = 1.70158
var t = argument0 * 2
s *= 1.525
if t < 1
	return 0.5 * (t * t *((s + 1) * t - s))
t -= 2

return 0.5 * (t * t * ((s + 1) * t + s) + 2)
