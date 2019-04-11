/// @description Exploding
var radir = random(360)
var radis = random(20)

for (var i = 0; i < arm_number; ++i) {
	if instance_exists(arm_instances[i]) {
		if random(10) < 5 {
			with arm_instances[i]
				event_user(0)
			break
		}
	}
}

enemy_explode(5 + random(5), 8, 2 + irandom(3), 0, lengthdir_x(radis, radir), lengthdir_y(radis, radir))

alarm[8] = seconds(0.3 + random(0.2))
