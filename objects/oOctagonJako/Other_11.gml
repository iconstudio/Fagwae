/// @description Creation

path_start(type_create, 3, path_action_stop, false)

shot_mode = -1
shot_speed = 4.5 + global.stage * 0.25
shot_count = 0
if global.extreme {
	shot_period1 = seconds(random(2) + 0.1)
	shot_period2 = 4 - shot_period1
} else {
	shot_period1 = seconds(random(2.5) + 01.)
	shot_period2 = 5 - shot_period1
}
shot_period_continue = seconds(max(0.52, 1.7 - global.stage * 0.3))
