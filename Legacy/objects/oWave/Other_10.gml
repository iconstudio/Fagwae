for (var i = 0; i < wave_vertexes; ++i) {
	otxx[i] = (x - border + size_origin * wave_lengthx[i]) / width_interpolated * global.surface_w
	otxy[i] = (y - border + size_origin * wave_lengthy[i]) / height_interpolated * global.surface_h
	prvx[i] = x + wave_lengthx[i] * size_previous
	prvy[i] = y + wave_lengthy[i] * size_previous
	newx[i] = x + wave_lengthx[i] * size_newer
	newy[i] = y + wave_lengthy[i] * size_newer
	ptxx[i] = prvx[i] / fullwidth_interpolated * global.surface_w
	ptxy[i] = prvy[i] / fullheight_interpolated * global.surface_h
}
