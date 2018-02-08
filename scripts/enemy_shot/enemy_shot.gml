/// @description enemy_shot(x, y, speed, direction, [type])
/// @function enemy_shot
/// @param x { real }
/// @param y { real }
/// @param speed { real }
/// @param direction { real }
/// @param [type] { object }

if !global.playeralive
	return noone

var type = oEnemyBullet
if argument_count == 5
	type = argument[4]

with instance_create_depth(argument[0], argument[1], depth + 1, type) {
	speed = argument[2]
	direction = argument[3]
	image_angle = argument[3]

	audio_play_sound(soundShotEnemy, 2, false)

	if object_index == oEnemyBullet {
		with instance_create_depth(x, y, depth - 2, oEnemyBulletCreate) {
			parent = other.id
			speed = other.speed
			direction = other.direction
			image_angle = other.image_angle
			image_index = other.image_index
		}
	}

	return id
}