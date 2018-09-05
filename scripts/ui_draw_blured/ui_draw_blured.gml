/// @description ui_draw_blured(x,y,left,top,width,height)
/// @function ui_draw_blured 
/// @param x position { real }
/// @param y position { real }
/// @param left coordinate { real }
/// @param top coordinate { real }
/// @param width size { real }
/// @param height size { real }

if argument4 = 0 || argument5 = 0
 return 0

surface_reset_target()

surface_set_target(ui_shared_surface())
shader_set(shaderBlur)
shader_set_uniform_f(global.shaBlur_texelSize, texture_get_texel_width(global.surface_tex), 0)
draw_transform_stack_push()
draw_transform_set_identity()
gpu_set_colorwriteenable(true, true, true, false)
draw_surface_part_ext(application_surface, argument2, argument3, argument4, argument5, argument2, argument3, 1, 1, $ffffff, 1)
gpu_set_colorwriteenable(true, true, true, true)
draw_transform_stack_pop()
shader_reset()
surface_reset_target()

surface_set_target(application_surface)
shader_set(shaderBlur)
shader_set_uniform_f(global.shaBlur_texelSize, 0, texture_get_texel_height(global.surface_tex))
draw_surface_part_ext(ui_shared_surface(), argument2, argument3, argument4, argument5, argument0, argument1, 1 / __sx, 1 / __sy, $cccccc, draw_get_alpha())
shader_reset()
