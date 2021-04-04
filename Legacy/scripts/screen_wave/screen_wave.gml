/// @description screen_wave(x, y, size)
/// @function screen_wave
/// @param x { real }
/// @param y { real }
/// @param size { real }
function screen_wave(argument0, argument1, argument2) {
	with instance_create_layer(argument0, argument1, "Screen", oWave) {
		size_target = argument2
		event_user(1)
	}



}
