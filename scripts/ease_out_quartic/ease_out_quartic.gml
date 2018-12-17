/// @description ease_out_quartic(value)
/// @function ease_out_quartic
/// @param value {real (0 ~ 1)}

var t = argument0 - 1;

return -(t * t * t * t - 1);
