/// @description Initialization

event_inherited()

// stat
shield = instance_create_depth(x, y, depth + 1, oPlayerShield)
shield.parent = id

// movement
slow = false
cangle = 2
friction = 0.6

// arm
angle_player = 0
angle_arm = 0

// shot
shoting = keyboard_check(ord("Z"))
shotfrm = 0
dshot = 0
lshot = 0
shtcnt = 0

// life outlines
out_rotation = 0
out_x = 41
out_y = 42
out_surfw = out_x * 2
out_surfh = round(out_y * 1.5)
event_user(0)
event_user(2)

// bomb
bomb_mode = 0 // 0: none, 1: charging, 2: end(explode!)

