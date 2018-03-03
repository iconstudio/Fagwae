/// @description 

if shot_count == 0
	shot_dir = point_direction(x, y, global.px, global.py)

enemy_shot(x, y, 5 + global.stage / 6, shot_dir)

if ++shot_count < 3 {
	alarm[0] = max(1, 10 - global.stage * 0.25)
} else {
	shot_count = 0
	alarm[0] = max(20, 55 - global.stage * 3 - global.extreme * 10)
}
