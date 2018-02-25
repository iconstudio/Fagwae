/// @description 

if !instance_exists(parent) {
	if x < -40 or x > room_width + 40 or y > room_height + 40 or y < -40
		instance_destroy()
}
