/// @description 

if type_create == 0 {
	if image_alpha > 0
		image_alpha -= 0.01
	else
		instance_destroy()
}
