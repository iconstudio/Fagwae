/// @description show_polygon(x, y, vertex, size, color, rotated)
/// @function show_polygon
/// @param x { real }
/// @param y { real }
/// @param vertex { integer }
/// @param size { real }
/// @param color { real }
/// @param rotated { boolean }

if argument4 <= 0
	exit

with instance_create_layer(argument0, argument1, "Effect", oParticleShape) {
	vertex = argument2
	tsize = argument3
	image_blend = argument4

	if !argument5
		exit

	if vertex == 8 {
		image_angle = 22.5
	} else {
		if vertex != 6
			image_angle = 180 / vertex
	}
}
