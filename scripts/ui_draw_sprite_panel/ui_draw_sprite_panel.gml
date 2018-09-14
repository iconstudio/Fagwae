/// @description ui_draw_sprite_panel(sprite,subimg,border,x,y,width,height)
/// @param sprite
/// @param subimg
/// @param border
/// @param x
/// @param y
/// @param width
/// @param height

var border = argument2
var sa = draw_get_alpha(), sc = draw_get_color()
var sw = sprite_get_width(argument0), sh = sprite_get_height(argument0)
var px = sw - border, py = sh - border
var pw = sw - border * 2, ph = sh - border * 2
var pws = pw / sw, phs = ph / sh
/*
// top
var x1 = argument3
var y1 = argument4
var x2 = argument3 + border
var y2 = argument4
var x3 = argument3 + argument5 - border * 2
var y3 = argument4
// middle
var x4 = argument3
var y4 = argument4 + border
var x5 = argument3 + border
var y5 = argument4 + border
var x6 = argument3 + argument5 - border * 2
var y6 = argument4 + border
// bottom
var x7 = argument3
var y7 = argument4 + argument6 - border * 2
var x8 = argument3 + border
var y8 = argument4 + argument6 - border * 2
var x9 = argument3 + argument5 - border * 2
var y9 = argument4 + argument6 - border * 2

draw_sprite_part_ext(argument0, argument1, 0, 0, border, border, x1, y1, 1, 1, sc, sa)
draw_sprite_part_ext(argument0, argument1, border, 0, pw, border, x2, y2, pws, 1, sc, sa)
draw_sprite_part_ext(argument0, argument1, px, 0, border, border, x3, y3, 1, 1, sc, sa)

draw_sprite_part_ext(argument0, argument1, 0, border, border, ph, x4, y4, 1, phs, sc, sa)
draw_sprite_part_ext(argument0, argument1, border, border, pw, ph, x5, y5, pws, phs, sc, sa)
draw_sprite_part_ext(argument0, argument1, px, py, border, ph, x6, y6, 1, phs, sc, sa)

draw_sprite_part_ext(argument0, argument1, 0, py, border, border, x7, y7, 1, 1, sc, sa)
draw_sprite_part_ext(argument0, argument1, border, py, pw, border, x8, y8, pws, 1, sc, sa)
draw_sprite_part_ext(argument0, argument1, px, py, border, border, x9, y9, 1, 1, sc, sa)
*/

//*
var bordersize = border / sw
var x1 = argument3
var x2 = argument3 + argument2
var x3 = argument3 + argument5 - argument2
var x4 = argument3 + argument5
var y1 = argument4
var y2 = argument4 + argument2
var y3 = argument4 + argument6 - argument2
var y4 = argument4 + argument6

draw_primitive_begin_texture(pr_trianglestrip, sprite_get_texture(argument0, argument1))
draw_vertex_texture(x1, y1, 0, 0)
draw_vertex_texture(x1, y2, 0, bordersize)
draw_vertex_texture(x2, y1, bordersize, 0)

draw_vertex_texture(x2, y2, bordersize, bordersize)
draw_vertex_texture(x3, y1, 1 - bordersize, 0)
draw_vertex_texture(x3, y2, 1 - bordersize, bordersize)

draw_vertex_texture(x4, y1, 1, 0)
draw_vertex_texture(x4, y2, 1, bordersize)
draw_vertex_texture(x4, y3, 1, 1 - bordersize)
//
draw_vertex_texture(x3, y2, 1 - bordersize, bordersize)
draw_vertex_texture(x3, y3, 1 - bordersize, 1 - bordersize)
draw_vertex_texture(x2, y2, bordersize, bordersize)
draw_vertex_texture(x2, y3, bordersize, 1 - bordersize)

draw_vertex_texture(x1, y2, 0, bordersize)
draw_vertex_texture(x1, y3, 0, 1 - bordersize)

draw_vertex_texture(x1, y4, 0, 1)
draw_vertex_texture(x2, y3, bordersize, 1 - bordersize)
draw_vertex_texture(x2, y4, bordersize, 1)

draw_vertex_texture(x3, y3, 1 - bordersize, 1 - bordersize)
draw_vertex_texture(x3, y4, 1 - bordersize, 1)
draw_vertex_texture(x4, y3, 1, 1 - bordersize)
draw_vertex_texture(x4, y4, 1, 1)
draw_primitive_end()
//draw_sprite_part_ext(argument0, argument1, border, border, pw, ph, x2, y2, pws, phs, sc, sa)
//*/
