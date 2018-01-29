/// @description menu_change_down(depth)
/// @function menu_change_down
/// @param depth { integer }

menu_change_ready(argument0)

if menusel[argument0] < menucnt[argument0] - 1
	menusel[argument0] += 1
else
	menusel[argument0] = 0

if menusel[argument0] == menucnt[argument0] - 1
 autostop = true
