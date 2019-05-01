/// @description Creation
/* 패턴: 1945 Strikers PLUS 의 6 탄 보스를 참고.
	하나의 코어 (A)
	3개의 가림막 (B)
	2개의 팔 (C)
	
	0. 처음에만 등장하자마자 빠르게 전진하며 팔을 앞으로 휘저음. (익스트림에선 확산탄 사격)
	
	1. 다시 뒤로 물러나며 조준탄 사격.
	
	2. 좌우를 왕복하며 비조준탄 뿌림.
		 동시에 조준탄 사격.
	
	3. 잠시 대기 후 중앙으로 이동 후 팔을 앞으로 뻗으며 팔에선 확산탄 사격.
	
	4. 팔을 뒤로 거둘때, 보스 뒤에서 철골들이 떨어짐.
	
	5. 잠시 뒤 맹렬하게 조준탄과 확산탄 사격.
	
	6. 좌측으로 이동 후 팔을 왼팔 오른팔 휘두름. (익스트림에선 반대로)
	
	7. 우측으로 이동 후 팔을 오른팔 왼팔 휘두름. (익스트림에선 반대로)
	
	8. 다시 중앙으로 이동 후에 패턴 2로 반복.
*/
name = "SUPER CIRCLE"

enemy_arm_init(enemy_boss_2B, 3, 30)
glove_left = enemy_create(enemy_boss_2C, x - 100, y + 100, LEFT, 0, id, "Boss_C")
glove_right = enemy_create(enemy_boss_2C, x + 100, y + 100, RIGHT, 0, id, "Boss_C")

x = room_width * 0.5
y = -120

path_last = pathBoss2_0
path_start(pathBoss2_0, room_height / seconds(2.5), path_action_stop, false)
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
pattern02_await = seconds(1.2 - global.extreme * 0.6)
pattern02_speed = player_hspeed * 0.8
pattern03_count = 0
pattern04_count = 0
pattern04_picked = choose(LEFT, RIGHT)
pattern05_count = 0
pattern05_tempo = 0

rotation = 0
hspeed_value = room_width / seconds(3) // 1.414
vspeed_value = room_height / seconds(4) // 5

shot_count = 0
shot_speed = enemy_bullet_speed_medium
