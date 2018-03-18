/// @description Removing

if !instance_exists(parent) and (y > screen_height + 48 or y < -300 or x < -120 or x > screen_width + 120) {
	instance_destroy()
}
