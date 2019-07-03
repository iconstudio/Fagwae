/// @description Creation
/* 패턴: 1945 Strikers PLUS의 도시 보스를 참고.
	하나의 포탑 (Turret)
	세개의 방어구 (Plate)
	두개의 어깨 (Shoulder)
	두개의 팔 (Arm)
	네개의 집게 (Pincher)
	두개의 프로펠러 연결부 (Propeller Arm)
	
	0. out 계열의 easing 스크립트를 이용하여 걷는 모션을 취하며 등장. 이때 다발 사격.

	1-1. 양 팔을 가운데로 살짝 모으고 산탄 흩뿌리기. 익스트림에선 세줄로 사격.
	1-2e. 익스트림에선 양 팔을 벌리며 두줄 산탄 흩뿌리며 저격탄 사격.
	1-2n. 노말에선 양 팔을 벌리며 한줄 산탄 흩뿌리기.
	
	2. 왼쪽과 오른쪽 중 플레이어가 있는 방향으로 이동하며 양 팔에서 산탄 흩뿌리기.
	익스트림에선 3줄 사격과 동시에 보스에서 확산탄 사격. 체력이 낮아지면 이 과정
	순식간에 이루어짐. 1초안에서 이동과 모든 탄 흩뿌리기를 완료함.

	3. 잠시 대기 후 제자리에서 플레이어를 향해 양 팔에서 산탄 흩뿌리기.

	4. 다시 제자리에서 몸체에서 다량의 확산탄 흩뿌리며 저격 산탄 사격.
	익스트림은 더 오래 사격.

	5. 다시 중앙으로 돌아오고 팔을 번갈아가며 빠르게 뻗으며 산탄 사격.

	6-1. 팔을 뒤로 젖히고 뒤쪽에서 경로 할당없는 oFrameScout 여러기 등장.
	잠시 후 몸체의 사격 구멍에서 다량의 저격탄과 확산탄 사격.
	익스트림에선 양 팔에서 위아래로 산탄 사격. 또한 오래 지속함.
	6-2. 이미 한번 패턴 6을 거쳤다면 무작위로 패턴 1~3 중 하나로 되돌아감.

	7. 팔이 천천히 앞으로 되돌아오며 양 옆에서 oFrameTriangleSide 여러기 등장.
	익스트림에선 엄청 많이 나옴. 그리고 저격탄 사격. 체력이 낮아지면 무작위로 패턴 9 혹은 6으로 감.

	8. 저격 산탄을 뿌리고 패턴 1 혹은 2로 되돌아감. 체력이 낮아지면 패턴 9로 감.

	9. 중앙에서 약간 흔들리는 원호를 그리며 공전. 패턴 1 혹은 2로 되돌아감.
*/
name = ""
arm_number = 0
arm_startangle = 0
arm_properties = 0
//enemy_arm_add(

x = room_width * 0.5
y = -120

pattern = 0
pattern_opened = false
pattern_await_time = 0

velocity = room_width / seconds(2.3)

rotation = random(360)
rotate_begin = rotation
rotate_time = 0
rotate_period = seconds(1.3)
