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

// Fade
fade_current = 0
fade_target = 0
fade_alpha = 0
fade_easer = ease_straight

// Push Notification
callto = noone
construct = array_create(3)
notification_list = ds_list_create()
