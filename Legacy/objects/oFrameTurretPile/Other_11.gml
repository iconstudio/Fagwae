/// @description Creation
arm_number = 9
arm_startangle = 0
arm_properties = array_create(arm_number, 0)

var arm_layer = "Instances_Arms"
var arm_angle = random(360)
arm_properties[0] = [enemy_create(enemy_square_6, x, y, 0, random(360), id, arm_layer), 64 + random(20), arm_angle]
arm_angle += 50 + random(35)
arm_properties[1] = [enemy_create(enemy_square_6, x, y, 0, random(360), id, arm_layer), 64 + random(20), arm_angle]
arm_angle += 50 + random(35)
arm_properties[2] = [enemy_create(enemy_square_6, x, y, 0, random(360), id, arm_layer), 64 + random(20), arm_angle]
arm_angle += 50 + random(35)
arm_properties[3] = [enemy_create(enemy_square_6, x, y, 0, random(360), id, arm_layer), 64 + random(20), arm_angle]
arm_angle += 50 + random(35)
arm_properties[4] = [enemy_create(enemy_square_6, x, y, 0, random(360), id, arm_layer), 64 + random(20), arm_angle]
arm_layer = "Instances_Arms_Below"
arm_angle = random(360)
arm_properties[5] = [enemy_create(enemy_square_3, x, y, 0, 0, id, arm_layer), 50 + random(24), arm_angle]
arm_angle += 75 + random(30)
arm_properties[6] = [enemy_create(enemy_square_3, x, y, 0, 0, id, arm_layer), 50 + random(24), arm_angle]
arm_angle += 75 + random(30)
arm_properties[7] = [enemy_create(enemy_square_3, x, y, 0, 0, id, arm_layer), 50 + random(24), arm_angle]
arm_angle += 75 + random(30)
arm_properties[8] = [enemy_create(enemy_square_3, x, y, 0, 0, id, arm_layer), 50 + random(24), arm_angle]

for (var i = 0; i < arm_number; ++i) {
	var arm = arm_properties[i]

	with arm[0] {
		speed = 0
		parent = other.id

		hurt_upper_ratio = 0.9
		invincible = INVINCIBLE_PARENTAL
	}
}

velocity = area_vspeed * 0.5
vspeed = velocity
