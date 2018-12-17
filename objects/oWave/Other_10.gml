var cangx, cangy
for (var i = 0; i < cdet; ++i) {
	cangx = lengthdir_x(1, cang[i])
	cangy = lengthdir_y(1, cang[i])
	otxx[i] = (x - 20 + osiz * cangx) / width_interpolated * global.surface_w
	otxy[i] = (y - 20 + osiz * cangy) / height_interpolated * global.surface_h
	prvx[i] = x + cangx * psiz
	prvy[i] = y + cangy * psiz
	newx[i] = x + cangx * nsiz
	newy[i] = y + cangy * nsiz
	ptxx[i] = prvx[i] / fullwidth_interpolated * global.surface_w
	ptxy[i] = prvy[i] / fullheight_interpolated * global.surface_h
}
