/// @description Initialization
event_inherited()

// stat
hp = 2
pow = 50
//shot_damage = 3
shot_speed = 15
shot_period = seconds(0.07)
hp_max = 2
shield = instance_create_layer(x, y, "Player_Shield", oPlayerShield)
shield.parent = id
invincible = seconds(3)

// movement
angle_player = 0
hspeed_max = player_hspeed
vspeed_max = player_vspeed
speed_sqrt = sqrt(2)
slow = false
//diaccel_time = 0
//diaccel_period = seconds(0.14)

// arm
angle_arm_left = 2
angle_arm_right = 2

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

