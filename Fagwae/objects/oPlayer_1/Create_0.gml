/// @description Initialization
event_inherited()

action_status = PLAYER_ACTION_MODES.IDLE
action_time = 0
action_spring_period = seconds(0.04)

ground_coyote_period = COYOTE_GROUND_PERIOD

move_key_anchor = RIGHT
move_dir = 0
move_speed = KILOMETER_PER_HOUR(28)
move_accel = KILOMETER_PER_HOUR(3)
move_forbid_period = seconds(0.01)
move_forbid_period_wall = seconds(0.04)
move_forbid_time = 0

jump_speed = KILOMETER_PER_HOUR(65)
jump_speed_h_neutral = KILOMETER_PER_HOUR(20)
jump_speed_h_wall = KILOMETER_PER_HOUR(40)
jump_period = seconds(0.35)
jump_time = jump_period

jump = function() {
	var Grounded = (grounded_state == TERRAIN_TYPE.GROUND)
	var Condition_Ground, Condition_Neutral, Condition_Wall
	Condition_Ground = (Grounded and action_status == PLAYER_ACTION_MODES.IDLE)
	if Condition_Ground {
		jump_on_ground()
		exit
	}

	var Moving = (move_key_anchor != NONE)
	var Wall_in_front = check_solid_horizontal(img_xscale)
	Condition_Neutral = (!Moving and Wall_in_front and action_status == PLAYER_ACTION_MODES.IDLE)
	if Condition_Neutral {
		jump_on_neutral()
		exit
	}

	var Hanging = (action_status == PLAYER_ACTION_MODES.HOOK or action_status == PLAYER_ACTION_MODES.LADDER)
	var Wall_on_left = check_solid_horizontal(-1)
	var Wall_on_right = check_solid_horizontal(1)
	var Wall_check = (Wall_on_left or Wall_on_right)
	Condition_Wall = Moving and action_status != PLAYER_ACTION_MODES.SPRING and (Hanging or Wall_check)
	if Condition_Wall {
		if action_status == PLAYER_ACTION_MODES.IDLE {
			if Wall_in_front
				img_xscale *= -1
		}
		jump_on_wall()
		move_forbid_time = move_forbid_period_wall
	}
}

jump_on_ground = function() {
	velocity_y = -jump_speed
	if move_key_anchor == NONE {
		if velocity_x != 0 {
			velocity_x += move_accel * sign(velocity_x)
		}
	} else { // add a little speed
		if velocity_x == 0 {
			velocity_x += move_accel * sign(move_key_anchor)
		} else { // add a little speed
			velocity_x += move_accel * sign(velocity_x)
		}
	}
}

jump_on_neutral = function() {
	velocity_x = jump_speed_h_neutral * -img_xscale
	velocity_y = -jump_speed
}

jump_on_wall = function() {
	velocity_y = -jump_speed
	velocity_x = jump_speed_h_wall * img_xscale
}
