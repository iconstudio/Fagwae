/// @description enemy_explode(shake_magnitude, wave_amplitude, flame_count, score_count, [ax], [ay])
/// @function enemy_explode
/// @param shake_magnitude { real }
/// @param wave_amplitude { real }
/// @param flame_count { integer }
/// @param score_count { integer }
/// @param [ax] { real }
/// @param [ay] { real }

var ax = 0, ay = 0
if argument_count >= 5 {
	ax = argument[4]
	if argument_count >= 6
		ay = argument[5]
}

if global.setting_effect && argument[0] > 0
	screen_shake(argument[0])

if global.setting_effect && argument[1] > 0
	screen_wave(x, y, argument[1])

repeat argument[2] {
	with instance_create_layer(x + ax, y + ay, "Effect", oParticleFlameGenerator) {
		direction = random(360)
		speed = 8 + random(8)
	}
}

repeat argument[3] + global.extreme * 3 {
	with instance_create_layer(x + ax, y + ay, "Effect", oPlayerScorePiece) {
		speed = 4 + random(3) + speed / 2
		direction = 45 + random(90)
	}
}

//screen_liner(argument4 + pscore);

if dead {
	if audio_exists(sound_dead)
		audio_play_sound(sound_dead, 10, false)
}