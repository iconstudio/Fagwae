/// @description Creation
velocity = player_vspeed
if path_exists(type_create) {
	path_start(type_create, velocity, path_action_stop, true)
} else {
	vspeed = velocity
}
