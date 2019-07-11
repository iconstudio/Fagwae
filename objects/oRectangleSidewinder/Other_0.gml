/// @description Specilalization of Destroying
if y > screen_height + 48 or y < -90 or x < -120 or x > screen_width + 120
	instance_destroy()
else
	alarm[0] = seconds(1.4)
