/// @description 

var i, lx, ly, dchr
for (i = dcnt1; i <= 2; ++i) {
 lx = lengthdir_x(1, rots + i * 42)
 ly = lengthdir_y(1, rots + i * 42)
 draw_sprite_ext(sBackSquare, 0, 225 + lx * 204, 500 + i * 144 + scroll, 1, 1, ly * 56, make_color_hsv(square_saturation - 20 + i * 5, 150, 144), brightness)
}

