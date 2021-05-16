/// @description Drawing a wave
draw_set_alpha(1)
draw_set_color($ffffff)
for (var i = 0; i < wave_vertexes_less; ++i) {
 draw_primitive_begin_texture(pr_trianglefan, global.application_texture)
 draw_vertex_texture(newx[i], newy[i], otxx[i], otxy[i])
 draw_vertex_texture(newx[i + 1], newy[i + 1], otxx[i + 1], otxy[i + 1])
 draw_vertex_texture(prvx[i + 1], prvy[i + 1], ptxx[i + 1], ptxy[i + 1])
 draw_vertex_texture(prvx[i], prvy[i], ptxx[i], ptxy[i])
 draw_primitive_end()
}

draw_primitive_begin_texture(pr_trianglefan, global.application_texture)
draw_vertex_texture(newx[wave_vertexes_less], newy[wave_vertexes_less], otxx[wave_vertexes_less], otxy[wave_vertexes_less])
draw_vertex_texture(newx[0], newy[0], otxx[0], otxy[0])
draw_vertex_texture(prvx[0], prvy[0], ptxx[0], ptxy[0])
draw_vertex_texture(prvx[wave_vertexes_less], prvy[wave_vertexes_less], ptxx[wave_vertexes_less], ptxy[wave_vertexes_less])
draw_primitive_end()
