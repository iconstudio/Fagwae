/// @description Creation

/* 패턴: 1945 Strikers PLUS 의 6 탄 보스를 참고.
	하나의 코어 (A)
	두개의 가림막 (B)
	3개의 팔 (C)
	코어를 감싼 수많은 조각들 (사각형을 두름)
	
	0. 처음에만, 등장하자마자 빠르게 전전히며 팔을 앞으로 휘저음.  (익스트림에선 확산탄 사격)
	
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

x = view_width * 0.5
y = -120
fixy = y

vspeed = 8

mdist = 0
dangle = random(360)
angle = 0

arm_instances = []
arm_number = 0
arm_count = 0
arm_width = point_distance(lengthdir_x(1, 0), lengthdir_y(1, 0), lengthdir_x(1, 120), lengthdir_y(1, 120))
ccnt = 0

abool = 0
