/// @description number_format(number)
/// @function number_format
/// @param number { real }

return string(floor(argument0)) + "." + string(floor(argument0 * 10) mod 10)
