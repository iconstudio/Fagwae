/// @description menu_change_up(depth)
/// @function menu_change_up
/// @param depth { integer }

menu_change_ready(argument0)

if menusel[argument0] > 0
	menusel[argument0] -= 1
else
	menusel[argument0] = menucnt[argument0] - 1

if menusel[argument0] == 0
	autostop = true
