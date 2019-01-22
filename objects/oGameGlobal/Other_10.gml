/// @description Creating a new player
if global.playeralive
	exit

global.playerscore = 0
global.playeralive = true
global.px = room_width * 0.5
global.py = room_height - 100

var player = instance_create_layer(global.px, global.py, "Player", oPlayerInit)
if player_isfirst {
	player.invincible = 780
	player_isfirst = false
}
