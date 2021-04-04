/// @description ease_out_circ(delta)
/// @function ease_out_circ
/// @param delta { real }
function ease_out_circ(argument0) {
	if argument0 <= 0
		return 0
	else if argument0 >= 1
		return 1

	var t = argument0 - 1
	return sqrt(1 - t * t)



}
