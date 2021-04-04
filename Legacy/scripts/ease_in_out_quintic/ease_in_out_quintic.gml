/// @description ease_in_out_quintic(delta)
/// @function ease_in_out_quintic
/// @param delta { real }
function ease_in_out_quintic(argument0) {
	var t = argument0 * 2
	if t < 1
		return 0.5 * t * t * t * t * t
	t -= 2

	return 0.5 * (t * t * t * t * t + 2)



}
