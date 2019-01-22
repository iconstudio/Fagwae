/// @description Update
if invincible > 0 {
	if !instance_exists(oPlayerShield) { 
		shield = instance_create_layer(x, y, "Player_Shield", oPlayerShield)
		shield.parent = id
	}
	invincible--
} else if shield != noone {
	with shield
		instance_destroy()
	shield = noone
}

if !global.playeralive or instance_exists(oGameOver) {
	instance_destroy()
	exit
}

var ta = 2
mx = 0
my = 0
var pad_available = (gamepad_index != -1)

if keyboard_check(vk_left) or (pad_available and gamepad_button_check(gamepad_index, gp_padl)) {
	mx -= 1
	ta += 6
}

if keyboard_check(vk_right) or (pad_available and gamepad_button_check(gamepad_index, gp_padr)) {
	mx += 1
	ta += 6
}

if keyboard_check(vk_up) or (pad_available and gamepad_button_check(gamepad_index, gp_padu)) {
	my -= 1
}

if keyboard_check(vk_down) or (pad_available and gamepad_button_check(gamepad_index, gp_padd)) {
	my += 1
}

// move slowly
if keyboard_check(vk_shift) or io_check_triggerL() or io_check_buttonL() {
	movespd = moveospd / 1.5
	slow = true
	ta = 0
} else {
	movespd = moveospd
	slow = false
}

var analogue = false
if pad_available {
	var ahor = gamepad_axis_value(gamepad_index, gp_axislh)
	var aver = gamepad_axis_value(gamepad_index, gp_axislv)
	//show_debug_message(ahor)
	if round(ahor) != 0 or round(aver) != 0 {
		analogue = true

		if ahor != 0 and ta != 0
			ta += 6
		direction = point_direction(0, 0, ahor, aver)
		speed += point_distance(0, 0, ahor, aver)
	}
}
if analogue {
	
} else {
	var mhs = mx * 2
	var mvs = my * 2
	if mx != 0 and my != 0 {
		mhs *= movesqr
		mvs *= movesqr
	}
	hspeed += mhs
	vspeed += mvs
}
cangle += (ta - cangle) * 0.25
angle_player = -hspeed * 2

if speed > movespd
	speed = movespd

attack_check = (bomb_mode == 0) and (keyboard_check(ord("Z")) or io_check_triggerR() or io_check_buttonR() or io_check_padA())

if attack_check
	attack_count = 3

if attack_delay > 0 {
	attack_delay--
} else {
	if attack_count > 0 {
		var let, sangle = 90 + angle_arm + angle_player + random(1) - 0.5
		let = instance_create_layer(x + out_ax + lengthdir_x(40, sangle - cangle), y + 3 + out_ay + lengthdir_y(40, sangle - cangle), "Bullet_Player", oPlayerBullet)
		let.direction = sangle - cangle
		let.image_angle = let.direction - 90
		let.image_index = attack_frame
		let.speed = 26

		let = instance_create_layer(x - out_ax + lengthdir_x(40, sangle + cangle), y + 3 - out_ay + lengthdir_y(40, sangle + cangle), "Bullet_Player", oPlayerBullet)
		let.direction = sangle + cangle
		let.image_angle = let.direction - 90
		let.image_index = attack_frame
		let.speed = 26

		audio_play_sound(soundShotPlayer, 5, false)
	}

	attack_count--
	attack_frame = (++attack_frame) mod 4
	attack_delay = shot_period
}
