/// @description Initialzation
application_surface_draw_enable(false)

event_user(0)

capture = noone
global.screenlock = false

// Shake
xo = 0
yo = 0
xn = 0
yn = 0
shake_level = 4
shake_meter = 80
shake_time = 100
shake_period = seconds(1)
