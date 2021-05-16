if global.effect_enemy_smoke_stream_speed < speed {
	speed += (global.effect_enemy_smoke_stream_speed - speed) * 0.08
} elif 0 < speed {
	speed -= speed * 0.057
}


if create_time < create_period {
	create_time += Delta
} else {
	

	create_time = 0
	create_period = random_range(create_period_min, create_period_max)
}


if 0 < duration {
	duration -= Delta
} else {
	instance_destroy()
}
