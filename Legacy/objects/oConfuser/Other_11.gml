/// @description Creation

shot_speed = enemy_bullet_speed_fast
alarm[0] = 30

confuse_path = path_add()
path_set_closed(confuse_path, false)
path_set_kind(confuse_path, 1)
path_set_precision(confuse_path, 8)

path_add_point(confuse_path, x, y, 100)
var ax, ay, i
for (i = 0; i < 9; ++i) {
	ax = min(max(0, x + random_range(-80, 80)), room_width)
	ay = min(max(0, y + random_range(i - 1, i + 1) * 120), room_height)
	path_add_point(confuse_path, ax, y, 100)
}
	
path_add_point(confuse_path, global.px, global.py, 100)
path_add_point(confuse_path, global.px, room_height + 100, 100)

path_start(confuse_path, 3, path_action_stop, false)
