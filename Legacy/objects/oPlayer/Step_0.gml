/// @description Update
if 0 < invincible {
	if !instance_exists(shield) { 
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

// movements
var mx = 0, my = 0, speed_standard
var check_left = keyboard_check(vk_left) or io_check_left()
var check_right = keyboard_check(vk_right) or io_check_right()
mx = check_right - check_left
if check_right and check_left {
	angle_arm_left = 6
	angle_arm_right = 6
} else if check_right and !check_left {
	angle_arm_left = 0
	angle_arm_right = 6
} else if !check_right and check_left {
	angle_arm_left = 6
	angle_arm_right = 0
} else {
	angle_arm_left = 2
	angle_arm_right = 2
}

var check_up = keyboard_check(vk_up) or io_check_up()
var check_down = keyboard_check(vk_down) or io_check_down()
my = check_down - check_up

// move slowly
if keyboard_check(vk_shift) or io_check_triggerL() or io_check_buttonL() {
	speed_standard = 0.666
	angle_arm_left = 0
	angle_arm_right = 0
	slow = true
} else {
	speed_standard = 1
	slow = false
}

if mx != 0 or my != 0 {
	var mhs = mx * hspeed_max
	var mvs = my * vspeed_max
	if mx != 0 and my != 0 {
		mhs *= speed_sqrt
		mvs *= speed_sqrt
	}

	hspeed = mhs
	vspeed = mvs
} else {
	speed = 0
}
if speed != 0 {
	hspeed = clamp(hspeed, -hspeed_max, hspeed_max)
	vspeed = clamp(vspeed, -vspeed_max, vspeed_max)
	speed *= speed_standard
}
angle_player = -hspeed * 2

attack_check = (bomb_mode == 0) and (keyboard_check(ord("Z")) or io_check_triggerR() or io_check_buttonR() or io_check_padA())
if attack_check
	attack_count = 3

if 0 < attack_delay {
	attack_delay--
} else {
	if 0 < attack_count {
		var let, sangle = 90 + angle_player + random(1) - 0.5
		let = instance_create_layer(x + out_ax + lengthdir_x(40, sangle - angle_arm_right), y + 3 + out_ay + lengthdir_y(40, sangle - angle_arm_right), "Bullet_Player", oPlayerBullet)
		let.direction = sangle - angle_arm_right
		let.image_angle = let.direction - 90
		let.image_index = attack_frame
		let.speed = shot_speed

		let = instance_create_layer(x - out_ax + lengthdir_x(40, sangle + angle_arm_left), y + 3 - out_ay + lengthdir_y(40, sangle + angle_arm_left), "Bullet_Player", oPlayerBullet)
		let.direction = sangle + angle_arm_left
		let.image_angle = let.direction - 90
		let.image_index = attack_frame
		let.speed = shot_speed

		audio_play_sound(soundShotPlayer, 5, false)
	}

	attack_count--
	attack_frame = (++attack_frame) mod 4
	attack_delay = shot_period
}
