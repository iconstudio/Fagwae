/// @description 

var sspd
if global.extreme
	sspd = 1.2 + scount / 4 + global.stage / 8
else
	sspd = 2 + scount / 2 + global.stage / 6
enemy_shot(x, y, sspd, point_direction(x, y, global.px, global.py) + lengthdir_x(28, (scount + pangle) * 12.7))
enemy_shot(x, y, sspd, point_direction(x, y, global.px, global.py) + lengthdir_y(28, (scount + pangle) * 21.9))

scount += 1
if scount < 11 + global.stage / 2 + global.extreme * 10 {
	alarm[0] = max(1, 5 - global.stage / 4 - global.extreme * 2)
} else {
	alarm[1] = max(1, 26 - global.stage / 2 - global.extreme * 2)
	smode = 1
}
