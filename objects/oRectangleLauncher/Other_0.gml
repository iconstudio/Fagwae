if bbox_top > room_height or bbox_right < 0 or bbox_left > room_width {
	enemy_arm_destroy()
	instance_destroy()
}
