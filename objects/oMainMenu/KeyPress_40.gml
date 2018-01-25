/// @description Going menu up

if menu_outta()
	exit

menu_change_ready(menudepth)

if menusel[menudepth] < menucnt[menudepth] - 1
	menusel[menudepth] += 1
else
	menusel[menudepth] = 0

if menusel[menudepth] == menucnt[menudepth] - 1
 autostop = true

key_press()
