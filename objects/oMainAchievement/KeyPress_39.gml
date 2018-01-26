/// @description Select right one

if selected < global.achievement_count - 1
	selected += 1
else
	selected = 0

if selected == global.achievement_count - 1
	autostop = true

key_press()
