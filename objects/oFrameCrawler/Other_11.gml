/// @description Creation
planning_count = 0
planning_count_max = 5 + global.extreme * 2
planning_time = 0
planning_period = seconds(4)
planning_path = path_add()
path_set_kind(planning_path, 1)
path_set_closed(planning_path, false)
path_set_precision(planning_path, 8)
path_index = planning_path
event_user(10)

enemy_arm_init(enemy_arm_crawler_terminal, 2, 20, -1)
