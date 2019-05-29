/// @description Exploding
var radir = random(360)
var radis = random(instance_number(oEnemyParent) * 6 + 36)

for (var i = 0; i < arm_number; ++i) {
	arm = arm_properties[i]

	if instance_exists(arm[0]) {
		if random(10) < 1 {
			with arm[0]
				event_user(0)
			break
		}
	}
}
enemy_explode(10 + irandom(5), 0, 2 + irandom(2), 0, lengthdir_x(radis, radir), lengthdir_y(radis, radir))

alarm[2] = seconds(0.18 + random(0.05))
