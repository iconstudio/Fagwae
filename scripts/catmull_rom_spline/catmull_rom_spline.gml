/// @description catmull_rom_spline(delta, x1, x2, x3, x4)
/// @function catmull_rom_spline
/// @param delta { real }
/// @param x1 { real }
/// @param x2 { real }
/// @param x3 { real }
/// @param x4 { real }

var __c3, __c4
__c3 = argument1 - argument2 * 2.5 + argument3 * 2 - argument4 * 0.5
__c4 = (argument4 - argument1) * 0.5 + (argument2 - argument3) * 1.5

return (((__c4 * argument0 + __c3) * argument0 + (argument3 - argument1) * 0.5) * argument0 + argument2)
