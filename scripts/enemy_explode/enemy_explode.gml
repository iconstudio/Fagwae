/// @description enemy_explode(shake_magnitude, wave_amplitude, flame_count, score_count, [ax], [ay])
/// @function enemy_explode
/// @param shake_magnitude { real }
/// @param wave_amplitude { real }
/// @param flame_count { integer }
/// @param score_count { integer }
/// @param [ax] { real }
/// @param [ay] { real }
var ax = 0, ay = 0
if 4 < argument_count {
	ax = argument[4]
	if 5 < argument_count
		ay = argument[5]
}

if global.setting_effect {
	if 0 < argument[0]
		screen_shake(argument[0])

	if 0 < argument[1]
		screen_wave(x + ax, y + ay, argument[1])

	repeat argument[2] {
		with instance_create_layer(x + ax, y + ay, "Effect", oParticleFlameGenerator) {
			direction = random(360)
			speed = 8 + random(8)
		}
	}
}

if !dead
	exit

repeat argument[3] + global.extreme * 2 {
	with instance_create_layer(x + ax, y + ay, "Effect", oPlayerScorePiece) {
		velocity_begin = player_vspeed * 3 + speed * 0.5
		speed = velocity_begin
		direction = 45 + random(90)
	}
}

//screen_liner(argument4 + pscore)

if audio_exists(sound_dead)
	audio_play_sound(sound_dead, 10, false)

show_flashstring(x, y - 12, "+" + number_format(argument[0]), 1)
