/// @description Update
motion_planning_process()

enemy_arm_fix(rotation)

rotation = rotate_begin + rotate_time / rotate_period * 360
if rotate_time < rotate_period
	rotate_time++
else
	rotate_time = 0
