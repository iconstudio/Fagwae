/// @description Creation

x = view_width * 0.5
y = -80
fixy = y

vspeed = 1.5

mdist = 0
dangle = random(360)
angle = 0

arm_instances = []
arm_number = 0
arm_count = 0
arm_width = point_distance(lengthdir_x(1, 0), lengthdir_y(1, 0), lengthdir_x(1, 120), lengthdir_y(1, 120))
ccnt = 0

abool = 0
alarm[0] = 90
alarm[1] = 140
