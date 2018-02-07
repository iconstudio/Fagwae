/// @description Creating a new player

if global.playeralive
	exit

score = 0
global.playeralive = true
global.score_combo = 0
global.px = view_width / 2
global.py = view_height - 100

global.player_fever_laser = 0
global.player_fever_shield = 0

var player = instance_create_layer(global.px, global.py, "Player", oPlayerInit)
if player_isfirst {
	player.invincible = 780
	player_isfirst = false
}
