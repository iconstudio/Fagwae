/// @description Creation
name = "OCTAGON"

velocity = player_vspeed * 0.75
if path_exists(type_create) {
	path_start(type_create, velocity, path_action_stop, false)
} else {
	hspeed = 0
	vspeed = velocity
	alarm[0] = seconds(global.extreme ? random(3) : seconds(random(2) + 2)) 
}

shot_mode = -1
shot_speed = enemy_bullet_speed_medium
shot_count = 0
if global.extreme {
	shot_period1 = seconds(random(2) + 0.1)
	shot_period2 = 4 - shot_period1
} else {
	shot_period1 = seconds(random(2.5) + 0.5)
	shot_period2 = 5 - shot_period1
}
shot_period_continue = seconds(max(0.52, 1.7 - global.stage * 0.3)) * 2
