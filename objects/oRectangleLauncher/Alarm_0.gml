/// @description 

if shot_count == 0
	shot_dir = point_direction(x, y, global.px, global.py)

enemy_shot(x, y, 5 + global.stage / 6, shot_dir)

if ++shot_count < 4 {
	alarm[0] = max(1, 10 - global.stage / 4)
} else {
	shot_count = 0
	alarm[0] = max(1, 40 - global.stage * 2)
}
