/// @description Creation
name = "HEXAGON"

enemy_arm_init(enemy_arm_hexagon_1, 3, 23)

vspeed = player_vspeed * 0.75

rotate_begin = random(360)
rotate_time = 0
rotate_period = seconds(2.7)
image_angle = rotate_begin
