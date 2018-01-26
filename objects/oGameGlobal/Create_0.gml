/// @description 

ipush = 1

score = 0
global.pscore = 0
global.vscore = 0
global.playeralive = false

global.dead_local = 0
global.framekill_local = 0
for (var i = 0; i < 8; ++i)
	global.achievement_getter[i] = false

global.achiveved_list = ds_list_create()
tcnt = 4
event_user(15)

event_user(0)

lalp = 0
global.lcnt = 0

gaugetexy = 0;
gaugerots = 0;
