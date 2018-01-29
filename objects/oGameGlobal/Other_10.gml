/// @description Creating a new player

if global.playeralive
	exit

score = 0
global.playeralive = true
global.pscore = 0
global.px = 225
global.py = 704

global.player_fever_laser = 0
global.player_fever_shield = 0

var player = instance_create_layer(global.px, global.py, "Player", oPlayerInit)
if player_isfirst {
	player.invincible = 600
	player_isfirst = false
}

//if (!instance_exists(oPauseManager))
// instance_create_layer(0, 0, "Screen", oPauseManager)

//if (!instance_exists(oParticleManager))
// instance_create_layer(0, 0, "Effect_1", oParticleManager)
