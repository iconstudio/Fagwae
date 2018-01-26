/// @description Update

if global.screenlock
	exit

if global.lcnt > 0
	lalp += (1 - lalp) / 3
else
	lalp -= lalp / 4
global.lcnt -= global.lcnt / 2

if instance_exists(oPlayerParent) {
	ipush -= ipush / 7
} else {
	if ipush < 1
		ipush += 0.004 + ipush / 10
	else
		ipush = 1
}

gaugetexy += 0.5
if gaugetexy >= 8
	gaugetexy -= 8

if global.hpc > 0
	global.hpc -= 1

if global.hpc = 0
	global.hpalpha -= global.hpalpha / 12

if global.hpalpha < 0.01 {
	global.hpalpha = 0
	global.hpdrawer = noone
}

gaugerots = (gaugerots + 3) mod 360

global.player_fever_laser = max(0, min(100, global.player_fever_laser))
global.player_fever_shield = max(0, min(100, global.player_fever_shield))

event_user(15)
