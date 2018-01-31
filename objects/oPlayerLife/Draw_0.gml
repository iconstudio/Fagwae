/// @description Draw borderlines and sprite

if !surface_exists(bsurf)
	event_user(0)

if !surface_exists(bsurf2)
	event_user(1)

brots -= 17
if (brots < 0)
 brots += 360
surface_set_target(bsurf)
draw_clear_alpha(0, 0)
draw_sprite_ext(sprite_index, 1, bsurfx, bsurfy, 0.5, 0.5, 0, $ffffff, 1)
surface_set_target(bsurf2)
draw_clear_alpha(0, 0)
draw_sprite_ext(sprite_index, 2, bsurfx, bsurfy, 0.5,  0.5, 0, $ffffff, 1)
surface_reset_target()

var dx = round(x)
var dy = round(y)
var dcol = make_color_hsv(32, 216, 255)
for (var i = 0; i < bsurfh; i += 2)
	draw_surface_part_ext(bsurf, 0, i, bsurfw, 2, dx - bsurfx, dy - bsurfy + i, 1, 1, dcol, 0.5 + lengthdir_x(0.4, brots + i * 7))

draw_sprite_ext(sprite_index, 0, dx, dy, 0.5, 0.5, 0, $ffffff, 1)

dcol = make_color_hsv(32, 216, 255)
for (var i = 0; i < bsurfh; i += 2)
	draw_surface_part_ext(bsurf2, 0, i, bsurfw, 2, dx - bsurfx, dy - bsurfy + i, 1, 1, dcol, 0.2 + lengthdir_x(0.2, brots / 3 + i * 7))
