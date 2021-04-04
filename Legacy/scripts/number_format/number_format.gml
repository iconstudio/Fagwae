/// @description number_format(number)
/// @function number_format
/// @param number { real }
function number_format(argument0) {

	return string(floor(argument0)) + "." + string(floor(argument0 * 10) mod 10)



}
