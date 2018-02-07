/// @description 

if y >= 700
	exit

if scount == 0 {
 var pd = point_direction(x, y, global.px, global.py)
 //enemy_shot(x, y, sspd, pd)
} else {
 //enemy_shot(x, y, sspd, pd - scount * 12)
 //enemy_shot(x, y, sspd, pd + scount * 12)
}

if ++scount < 4 {
	if global.extreme
		alarm[0] = max(2, 9 - global.diff / 2)
	else
		alarm[0] = max(2, 12 - global.diff / 2)
} else {
	scount = 0
	if global.extreme
		alarm[0] = max(5, 12 - global.diff / 5)
	else
		alarm[0] = max(8, 60 - global.diff * 4)
}
