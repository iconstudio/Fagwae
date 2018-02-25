/// @description 

if !instance_exists(parent) and (y > room_height + 48 or y < -90 or x < -120 or x > room_width + 120) {
	instance_destroy()
}
