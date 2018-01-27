/// @description 

for (var i = 0; i < cdet; ++i) {
 otxx[i] = (x - 20 + lengthdir_x(osiz, cang[i])) / (450 + bd2) * global.surface_w
 otxy[i] = (y - 20 + lengthdir_y(osiz, cang[i])) / (800 + bd2) * global.surface_h
 prvx[i] = x + lengthdir_x(psiz, cang[i])
 prvy[i] = y + lengthdir_y(psiz, cang[i])
 newx[i] = x + lengthdir_x(nsiz, cang[i])
 newy[i] = y + lengthdir_y(nsiz, cang[i])
 ptxx[i] = prvx[i] / (view_width + bd2) * global.surface_w
 ptxy[i] = prvy[i] / (view_height + bd2) * global.surface_h
}
