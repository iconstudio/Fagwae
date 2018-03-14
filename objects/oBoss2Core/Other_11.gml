/// @description Creation

/* 패턴: 1945 Strikers PLUS 의 6 탄 보스를 참고.
	하나의 코어 (A)
	3개의 가림막 (B)
	2개의 팔 (C)
	
	0. 처음에만 등장하자마자 빠르게 전진하며 팔을 앞으로 휘저음. (익스트림에선 확산탄 사격)
	
	1. 다시 뒤로 물러나며 조준탄 사격.
	
	2. 팔을 좌우로 휘두르며 비조준탄 뿌림.
		 동시에 조준탄 사격.
	
	3. 좌우를 왕복하며 비조준탄 뿌림.
	
	4. 잠시 대기 후 중앙으로 이동 후 팔을 앞으로 뻗으며 팔에선 확산탄 사격.
	
	5. 팔을 뒤로 거둘때, 보스 뒤에서 철골들이 떨어짐.
	
	6. 잠시 뒤 맹렬하게 조준탄과 확산탄 사격.
	
	7. 좌측으로 이동 후 팔을 왼팔 오른팔 휘두름. (익스트림에선 반대로)
	
	8. 우측으로 이동 후 팔을 오른팔 왼팔 휘두름. (익스트림에선 반대로)
	
	9. 다시 중앙으로 이동 후에 패턴 2로 반복.
*/

x = room_width * 0.5
y = -120

enemy_arm_init(enemy_boss_2B, 3, 30)

glove_left = enemy_create(enemy_boss_2C, x - 100, y + 100, LEFT, 0, id, "Boss_C")
glove_right = enemy_create(enemy_boss_2C, x + 100, y + 100, RIGHT, 0, id, "Boss_C")

path_start(pathBoss2_0, 7, path_action_stop, false)
pattern = 0
pattern_opened = false

if global.extreme {
	pattern01_list = [1, 4, 5, 3]
} else {
	pattern01_list = [1, 2, 5, 1]
}

rotation = 0

shot_count = 0
shot_speed = 5.5 + global.stage * 0.25
