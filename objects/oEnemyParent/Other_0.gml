/// @description Removing
if !instance_exists(parent) and (bbox_top > room_height or bbox_right < 0 or bbox_left > room_width)
	instance_destroy()
