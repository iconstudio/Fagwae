/// @description Initialization

with oStageParent {
	if id != other.id {
		depth -= 1
		back_mode = 1 // the others would be gone
	}
}

// flags
flag_boss = false

// for stage title (each stage, not for 3 areas)
entrance_caption = ""
entrance_x = 0
entrance_y = -30
entrance_vspeed = area_vspeed

// for area separator (each area, not for all 12 stages)
y = -screen_height - 30
back_surface = -1
back_mode = 0
back = noone

// create background surface
event_user(0)

// create background (if doesn't exist)
event_user(1)

// initial waiting
area_delay_push(180)
