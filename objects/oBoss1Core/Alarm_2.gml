/// @description Exploding

var radir = random(360)
var radis = random(instance_number(oEnemyParent) * 6 + 36)

for (var i = 0; i < arm_count; ++i) {
	if instance_exists(arm_instances[i]) {
		if random(10) < 1 {
			with arm_instances[i]
				event_user(0)
			break
		}
	}
}

enemy_explode(7 + irandom(3), 0, 2 + irandom(2), 0, lengthdir_x(radis, radir), lengthdir_y(radis, radir))

alarm[2] = 12 + random(3)
