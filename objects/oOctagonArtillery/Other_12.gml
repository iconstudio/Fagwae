/// @description Update

event_inherited()

if moving_mode == 0 {
	paddition = 0
} else if moving_mode == 1 {
	if paddition < 3
		paddition += 0.1
	else
		moving_mode = 2
} else if moving_mode == 2 {
	paddition = 3
} else if moving_mode == 3 or moving_mode == 4 {
	if paddition > 0
		paddition -= 0.1
	else
		moving_mode = 0
}

pangle += paddition
enemy_arm_fix(pangle)
