/// @description Creation

event_inherited()

vspeed = 10

enemy_arm_init(enemy_arm_spread_1, 5, 20)

smode = 0
scount = 0
alarm[0] = 55

pangle = random(360)
event_user(2)

polygon = 8
polycol = make_color_rgb(80, 148, 56)

instance_change(object_index, false)
