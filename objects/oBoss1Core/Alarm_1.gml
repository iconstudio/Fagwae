/// @description Attacking

if abool { // straight
	var scnt = round(10 - arm_count / 2) + global.extreme * 4
	var ddir = 360 / scnt
	for (var i = 0; i < scnt; ++i)
		enemy_shot(x, y, 3 + global.stage / 6, angle * 19 + ddir * i)
} else { // reverse
	var scnt = round(10 - arm_count / 2) + global.extreme * 4
	var ddir = 360 / scnt
	for (var i = 0; i < scnt; ++i)
		enemy_shot(x, y, 4 + global.stage / 5, -angle * 19 + ddir * i + 180)
}

abool = !abool

alarm[1] = max(1, 15 - global.stage / 5 - global.extreme * 2)