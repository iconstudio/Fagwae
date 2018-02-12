/// @description Creation

event_inherited()

vspeed = 10

enemy_arm_init(enemy_arm_spread_1, 5, 20)

shot_mode = 0
shot_count = 0
alarm[0] = 55

pangle = random(360)
event_user(2)

instance_change(object_index, false)
