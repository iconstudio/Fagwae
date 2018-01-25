/// @description Going menu up

if menu_outta()
	exit

menu_change_ready(menudepth)

if menusel[menudepth] > 0
	menusel[menudepth] -= 1
else
	menusel[menudepth] = menucnt[menudepth] - 1

if menusel[menudepth] == 0
	autostop = true

key_press()
