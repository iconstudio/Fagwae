/// @description menu_text(originx, originy, text, scale, angle)
/// @function menu_text
/// @param originx { real }
/// @param originy { real }
/// @param text { string }
/// @param scale { real }
/// @param angle { real }

var __sx, __sy, __str, __sscl, __sw, __pa
__sx = argument0
__sy = argument1
__str = argument2
__sscl = argument3
__pa = draw_get_alpha()

if argument4 > 90
 draw_set_alpha((180 - argument4) / 90 * __pa)
else if argument4 < 0
 draw_set_alpha((90 + argument4) / 90 * __pa)
__sw = ((string_width(__str) - 1) * __sscl + __sx * 2) / 2

draw_transform_set_rotation_y(90)
draw_transform_add_translation(-__sw, 0, -__sw)
draw_transform_add_rotation_y(argument4)
draw_transform_add_translation(__sw, 0, __sw)

draw_text_transformed(__sx, __sy, __str, __sscl, abs(__sscl), 0)
draw_transform_set_identity()
draw_set_alpha(__pa)

return __sw
