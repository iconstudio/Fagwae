/// @description Initialization
image_speed = 0

sound_dead = noone

name = ""
parent = noone
hurt = 0 // for dying
hurt_upper_ratio = 1 / 3
damaged = 0 // for drawing

untargetable = false // cannot be hit
INVINCIBLE_NONE = 0
INVINCIBLE_PARENTAL = 1 // can be hit and send damage to its parent
INVINCIBLE_HARD = 2 // can be hit and doesn't get damage
INVINCIBLE_FULL = 3 // +it doesn't give player any scores
invincible = INVINCIBLE_NONE

event_user(1)
