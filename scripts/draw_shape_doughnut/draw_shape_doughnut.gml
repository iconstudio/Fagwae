/// @description draw_shape_doughnut(x, y, vertex, angle, outwidth, inwidth)
/// @function draw_shape_doughnut
/// @param x { real }
/// @param y { real }
/// @param vertex { integer }
/// @param angle { real }
/// @param outwidth { real }
/// @param inwidth { real }

var angle_draw = argument3
var aangle = 360 / argument2

draw_clear(angle_draw)
draw_transform_add_translation(argument0, argument1, 0)
for (var i = 0; i < argument2 + 1; ++i) {
 draw_primitive_begin(pr_trianglelist)
 draw_vertex(lengthdir_x(argument5, angle_draw), lengthdir_y(argument5, angle_draw))
 draw_vertex(lengthdir_x(argument4, angle_draw), lengthdir_y(argument4, angle_draw))
 draw_vertex(lengthdir_x(argument4, angle_draw + aangle), lengthdir_y(argument4, angle_draw + aangle))
 draw_vertex(lengthdir_x(argument4, angle_draw + aangle), lengthdir_y(argument4, angle_draw + aangle))
 draw_vertex(lengthdir_x(argument5, angle_draw), lengthdir_y(argument5, angle_draw))
 draw_vertex(lengthdir_x(argument5, angle_draw + aangle), lengthdir_y(argument5, angle_draw + aangle))
 draw_primitive_end()

 draw_line(lengthdir_x(argument5, angle_draw), lengthdir_y(argument5, angle_draw), lengthdir_x(argument5, angle_draw + aangle), lengthdir_y(argument5, angle_draw + aangle))
 draw_line(lengthdir_x(argument4, angle_draw), lengthdir_y(argument4, angle_draw), lengthdir_x(argument4, angle_draw + aangle), lengthdir_y(argument4, angle_draw + aangle))
 angle_draw += aangle
}
draw_transform_set_identity()
