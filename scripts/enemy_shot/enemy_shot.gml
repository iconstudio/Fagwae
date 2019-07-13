/// @description enemy_shot(x, y, speed, direction, [type])
/// @function enemy_shot
/// @param x { real }
/// @param y { real }
/// @param speed { real }
/// @param direction { real }
/// @param [type] { object }
if !global.playeralive or y < -sprite_height or y > room_height + sprite_yoffset
	return noone

var type = oEnemyBullet
if argument_count == 5
	type = argument[4]

with instance_create_layer(argument[0], argument[1], "Bullet", type) {
	speed = argument[2]
	direction = argument[3]
	image_angle = argument[3]

	motion_add(other.direction, other.speed)

	if object_index == oEnemyBullet {
		with instance_create_layer(x, y, "Bullet_Effect", oEnemyBulletCreate) {
			parent = other.id
			speed = other.speed
			direction = other.direction
			image_angle = other.image_angle
			image_index = other.image_index
		}
	}
	parent = find_hierachy(other.id)

	return id
}