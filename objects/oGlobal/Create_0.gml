/// @description Initialze Screen, Front-End

// General Screen
event_user(0)
global.screenlock = false

// Shake
xo = 0
yo = 0
xn = 0
yn = 0
shakelevel = 4
global.screenshake = 0

// Push Notification
callto = noone
construct = array_create(3)
notification_list = ds_list_create()
