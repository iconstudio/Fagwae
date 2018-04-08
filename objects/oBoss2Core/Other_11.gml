/// @description Creation

x = room_width * 0.5
y = -120

enemy_arm_init(enemy_boss_2B, 3, 30)

glove_left = enemy_create(enemy_boss_2C, x - 100, y + 100, LEFT, 0, id, "Boss_C")
glove_right = enemy_create(enemy_boss_2C, x + 100, y + 100, RIGHT, 0, id, "Boss_C")

path_last = pathBoss2_0
path_start(pathBoss2_0, 7, path_action_stop, false)
pattern = 0
pattern_opened = false
pattern_await = 0

if global.extreme {
	pattern01_list = [1, 4, 5, 3]
	pattern04_list = [3, 6, 5]
} else {
	pattern01_list = [1, 2, 5, 1]
	pattern04_list = [1, 3, 2]
}
pattern02_count = 0
pattern03_count = 0
pattern04_count = 0
pattern04_picked = choose(LEFT, RIGHT)
pattern05_count = 0
pattern05_tempo = 0

rotation = 0

shot_count = 0
shot_speed = 6
