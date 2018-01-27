/// @description Drawing a wave

draw_set_alpha(1)
draw_set_color($ffffff)
for (var i = 0; i < fdet; ++i) {
 draw_primitive_begin_texture(pr_trianglefan, global.surface_tex)
 draw_vertex_texture(newx[i], newy[i], otxx[i], otxy[i])
 draw_vertex_texture(newx[i + 1], newy[i + 1], otxx[i + 1], otxy[i + 1])
 draw_vertex_texture(prvx[i + 1], prvy[i + 1], ptxx[i + 1], ptxy[i + 1])
 draw_vertex_texture(prvx[i], prvy[i], ptxx[i], ptxy[i])
 draw_primitive_end()
}

draw_primitive_begin_texture(pr_trianglefan, global.surface_tex)
draw_vertex_texture(newx[fdet], newy[fdet], otxx[fdet], otxy[fdet])
draw_vertex_texture(newx[0], newy[0], otxx[0], otxy[0])
draw_vertex_texture(prvx[0], prvy[0], ptxx[0], ptxy[0])
draw_vertex_texture(prvx[fdet], prvy[fdet], ptxx[fdet], ptxy[fdet])
draw_primitive_end()
