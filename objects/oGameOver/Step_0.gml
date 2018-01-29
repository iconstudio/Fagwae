/// @description 

if image_alpha < 1 {
	image_alpha += 0.005
	if image_alpha >= 0.995
		screen_shake(10)
} else if ualpha > -0.6 {
	ualpha -= 0.01
} else {
	with all {
		if object_index != oGlobal
			instance_destroy()
	}

 room_goto(roomMain)
 profile_save(global.profilefile)
}
