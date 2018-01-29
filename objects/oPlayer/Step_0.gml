/// @description Update

if invincible > 0 {
	if !instance_exists(oPlayerShield) { 
		shield = instance_create_depth(x, y, depth + 1, oPlayerShield)
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

if keyboard_check(vk_left) or io_check_left() {
	mx -= 1
	ta += 6
}

if keyboard_check(vk_right) or io_check_right() {
	mx += 1
	ta += 6
}

if keyboard_check(vk_up) or io_check_up() {
	my -= 1
}

if keyboard_check(vk_down) or io_check_down() {
	my += 1
}

// move slowly
if keyboard_check(vk_shift) or io_check_triggerL() or io_check_buttonL() {
	movespd = moveospd / 1.5
	slow = true
} else {
	movespd = moveospd
	slow = false
}

var mhs = mx * 2
var mvs = my * 2

if mx != 0 && my != 0 {
	mhs *= movesqr
	mvs *= movesqr
}

cangle += (ta - cangle) / 4

hspeed += mhs
vspeed += mvs

angle_player = -hspeed * 2

if speed > movespd
	speed = movespd
