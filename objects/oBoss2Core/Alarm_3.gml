/// @description Dying

enemy_arm_explode()

dead = true
//show_polygon(x, y, 6, 160, polycol, polygon)
enemy_explode(25, 256, 9, 9)

if global.extreme
	instance_create_layer(x, y, "Player", oPlayerLife)
with instance_create_layer(x, y, "Backend", global.area_list[++global.stage]){
	back_color = oStageShape1.back_color
	square_saturation = oStageShape1.square_saturation

	back_alpha = oStageShape1.back_alpha
	background_param = oStageShape1.background_param
	scroll = oStageShape1.scroll
	rotation = oStageShape1.rotation
	brightness = oStageShape1.brightness
	score_alpha = oStageShape1.score_alpha
	score_rotation = oStageShape1.score_rotation
	score_wave = oStageShape1.score_wave
}

instance_destroy()
