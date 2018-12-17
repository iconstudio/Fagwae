/// @description Destroying decorations
if deco_count > deco_min {
	if deco_count == 3
		alarm[5] = deco_fail_period
	else if deco_count > 0
		alarm[5] = deco_fail_period * 0.5
	else
		alarm[5] = deco_fail_period * 0.333
	alarm[5] += seconds(random(0.2))

	screen_shake(min(3, irandom(deco_count + abs(deco_min))) + 3)
	audio_play_sound(asset_get_index("soundCrack" + string(irandom(3) + 1)), 30, false)
	var lx = lengthdir_x(1, rotation + deco_count * 42)
	var ly = lengthdir_y(1, rotation + deco_count * 42)
	with instance_create_layer(room_width * 0.5 + lx * 204, room_height * 0.5 + deco_count * 144 + scroll, layer, oShapeBackFlash) {
		image_angle = ly * 56

		screen_wave(x, y, 30 + random(10))
		repeat 2 + irandom(2) {
			with instance_create_layer(x, y, "Effect", oParticleFlameGenerator) {
				direction = random(360)
				speed = 4 + random(8)
			}
		}
	}

	screen_shake(irandom(min(deco_count, 2) + 3) + 5)
	audio_play_sound(soundDeadFrame, 30, false)
	deco_count--
}
