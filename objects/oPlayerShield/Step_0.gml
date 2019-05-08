/// @description Update
image_alpha = fadein_time / fadein_period
if fadein_time < fadein_period
	fadein_time++

brightness = 108 * (1 - ease_in_out_quintic(brightness_time / brightness_period))
if brightness_time < brightness_period {
	brightness_time++
}

if collide_time == 0
	pow = pow_default
else
	pow = 0

if collide_time < collide_period
	collide_time++
else
	collide_time = 0

/*
var collide_numbers = instance_place_list(x, y, oEnemyParent, collide_list, false)
if collide_numbers > 0 {
	var collide_instance
	for (var i = 0; i < collide_numbers; ++i) {
		collide_instance = collide_list[| i]
		if instance_exists(collide_instance) {
			
		}
	}
	ds_list_clear(collide_list)
}
