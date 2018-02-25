/// @description 

if y > room_height + 48 or y < -90 or x < -120 or x > room_width + 120 {
	instance_destroy()
} else {
	alarm[0] = 120
}
