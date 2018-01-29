/// @description Select left one

if dmode or rpush[0] >= 0.05
	exit

if selected > 0
	selected -= 1
else
	selected = global.achievement_count - 1

if selected == 0
	autostop = true

key_press()
