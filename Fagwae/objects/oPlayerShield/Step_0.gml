/// @description Life
if time < period {
	time += Delta
} else {
	instance_destroy()
}
