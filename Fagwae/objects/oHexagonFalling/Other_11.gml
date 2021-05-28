/// @description Creation
name = "HEXAGON"

enemy_arm_init(enemy_arm_hexagon_1, 3, 23)

speed_target = room_height / seconds(3)
vspeed = room_height / seconds(7)
gravity = 0.2
gravity_direction = 270

rotate_begin = random(360)
rotate_time = 0
rotate_period = seconds(2.1)
image_angle = rotate_begin
