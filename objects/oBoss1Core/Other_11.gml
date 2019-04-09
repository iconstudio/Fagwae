/// @description Creation
name = "SUPER HEXAGON"
x = room_width * 0.5
y = -80
fixy = y
appearing = true
appear_distance = 170 - y
appear_time = 0
appear_period = seconds(4)

move_distance_value = 35
move_distance = 0
move_distance_time = 0
move_distance_period = seconds(3)
move_angle = 0
move_angle_time = 0
move_angle_period = seconds(20)

arm_instances = []
arm_number = 0
arm_count = 0
arm_width = point_distance(lengthdir_x(1, 0), lengthdir_y(1, 0), lengthdir_x(1, 120), lengthdir_y(1, 120))
arm_creation_period = seconds(0.18)
ccnt = 0

arm_angle_begin = random(360)
arm_angle = arm_angle_begin
arm_angle_time = 0
arm_angle_period = seconds(3.4)

abool = 0
shot_speed = room_width / seconds(3.9)
shot_speed_green = room_width / seconds(6)
shot_period = seconds(0.5 - global.extreme * 0.27)
alarm[0] = appear_period + 1
