image_speed = 0.5
image_angle = random(360)
angle_dir = choose(-1, 1)

velocity_begin = 0
velocity_value = room_height / seconds(4)
velocity_time = 0
velocity_period = seconds(2)
stop_period = seconds(0.2 + random(0.2))
stop_time = stop_period

enable = false
homing = false
homing_velocity = room_height / seconds(2)
//alarm[0] = seconds(0.6)
