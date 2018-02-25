/// @description 

if !global.playeralive or instance_exists(oGameOver) or instance_exists(oContinue)
	exit

// damaged!
if hp > 0 {
	screen_wave(x, y, 96)
	hp--
	if global.score_combo != 0 {
		if global.score_combo > 10
			mscr = floor(global.score_combo / 2)
		else
			mscr = global.score_combo
		global.score_combo -= mscr
		show_flashstring(x, y - 12, "-" + number_format(mscr / 10), 1)
	}

	screen_shake(10)
	bullet_clear()
	invincible = 210
} else {
	//highscore_update()
	screen_wave(x, y, 216)
	hp = 0

	repeat (8) {
		with instance_create_layer(x, y, "Bullet_Effect", oParticleFlameGenerator) {
			direction = random(360)
			speed = random(8) + 8
		}
	}

	with instance_create_layer(x, y, "Player", oPlayerPiece) {
		sprite_index = other.sprite_index
		image_angle = other.angle_player
		hspeed = random(6) - 3
		vspeed = -random(7) - 6
	}

	with instance_create_layer(x + out_ax, y + 3 + out_ay, "Player", oPlayerPiece) {
		sprite_index = sPlayerArm
		image_angle = other.angle_player + other.angle_arm - other.cangle
		hspeed = -random(4) - 2
		vspeed = -random(7) - 6
	}

	with instance_create_layer(x - out_ax, y + 3 + out_ay, "Player", oPlayerPiece) {
		sprite_index = sPlayerArm
		image_angle = other.angle_player + other.angle_arm + other.cangle
		hspeed = random(4) + 2
		vspeed = -random(7) - 6
	}

	global.dead_local++
	global.status_dead++
	global.playeralive = false

	screen_shake(14)
	bullet_clear()
	profile_save(global.profilefile)

	with oPlayerShield
		instance_destroy()
	with oGameGlobal
		alarm[1] = 120
	instance_destroy()
}
