/// @description Update

event_inherited()

if pmode == 0 {
	paddition = 0
} else if pmode == 1 {
	if paddition < 3
		paddition += 0.1
	else
		pmode = 2
} else if pmode == 2 {
	paddition = 3
} else if pmode == 3 {
	if paddition > 0
		paddition -= 0.1
	else
		pmode = 0
}

pangle += paddition
enemy_arm_fix(pangle)
