/// @description Creation
shot_speed = enemy_bullet_speed_faster
shot_count = 0
pattern = 0
pattern_count = 0

rotation_step = choose(-1, 1, (x < room_width * 0.65 ? 1 : -1))

arm_wiggle = random(30)
arm_number = 6
arm_startangle = random(60)
arm_properties = array_create(arm_number, 0)

var arm_angle_one, arm
for (var i = 0; i < arm_number; ++i) {
	arm_angle_one = (arm_startangle + 360 / arm_number * i) mod 360
	arm_properties[i] = [enemy_create(enemy_joint_2, x, y, 0, arm_angle_one, id, "Instances_Arms"), 20, arm_angle_one]

	arm = arm_properties[i]
	with arm[0] {
		parent = other.id

		image_xscale = 0.6
		arm_wiggle = random(40)
		arm_number = 1
		arm_width = 30
		arm_angle = other.arm_angle
		arm_instance = enemy_create(enemy_joint_3, x, y, 0, arm_angle_one, id, "Instances_Arms")
		
		with arm_instance {
			parent = other.id
			
			image_xscale = 0.6
			image_yscale = 0.6
		}
	}
}

planning_count = 10 + global.extreme * 2
planning_time = 0
planning_period = seconds(planning_count * 4 + 3)
planning_path = path_add()
path_set_kind(planning_path, 1)
path_set_closed(planning_path, false)
path_set_precision(planning_path, 8)
path_add_point(planning_path, x, y, 100)
var _xp = x, _yp = y, _xn = x, _yn = y
repeat planning_count {
	while point_distance(_xp, _yp, _xn, _yn) < 200 {
		_xn = 80 + random(room_width - 160)
		_yn = 80 + random(room_height * 0.5)
	}
	path_add_point(planning_path, _xn, _yn, 100)
	_xp = _xn
	_yp = _yn
}
path_add_point(planning_path, x, -130, 100)
path_start(planning_path, 1, path_action_stop, true)

if global.extreme
	alarm[0] = seconds(0.4)
