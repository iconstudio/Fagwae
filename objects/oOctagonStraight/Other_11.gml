/// @description Creation

vspeed = 12

speed_shot = 4.5 + global.stage / 4
count_shot = 0
alarm[0] = 40

polygon = 8
if global.extreme
	polygon_color = make_color_rgb(174, 60, 60)
else
	polygon_color = make_color_rgb(60, 103, 174)
