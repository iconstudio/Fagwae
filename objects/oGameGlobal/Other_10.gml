/// @description Creating a new player

if global.playeralive
	exit

score = 0
global.playeralive = true
global.px = view_width * 0.5
global.py = view_height - 100

var player = instance_create_layer(global.px, global.py, "Player", oPlayerInit)
if player_isfirst {
	player.invincible = 780
	player_isfirst = false
}
