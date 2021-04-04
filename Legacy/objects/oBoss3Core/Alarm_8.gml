/// @description Exploding
var radir = random(360)
var radis = random(52)
enemy_explode(3 + random(4), 0, 2 + irandom(3), 0, lengthdir_x(radis, radir), lengthdir_y(radis, radir))

alarm[8] = seconds(0.1 + random(0.1))
