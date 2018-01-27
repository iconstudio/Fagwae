/// @description 

with (oBack) {
 if (salpha[0] > 0) {
  for (i = dcnt2; i <= 3; i += 1) {
   lx = lengthdir_x(1, rots + i * 42 + 90);
   ly = lengthdir_y(1, rots + i * 42 + 90);
   draw_sprite_ext(sprBackSquare, 0, 320 + lx * 96, 240 + i * 72 + scroll / 2, 0.5, 0.5, ly * 56, make_color_hsv(colc - 10 + i * 5, 140, 128), salpha[0]);
  }
 }
}
