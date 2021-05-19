switch mode {
	case MENU_STATUSES.NORMAL: {
		break
	}


	case MENU_STATUSES.OPENING: {
		if fade_time < fade_period {
			fade_time += Delta
		} else {
			fade_time = fade_period
			mode = MENU_STATUSES.NORMAL
		}
		break
	}


	case MENU_STATUSES.CLOSING: {
		if 0 < fade_time {
			fade_time -= Delta
		} else {
			fade_time = 0
			mode = MENU_STATUSES.NORMAL
		}
		break
	}


	case MENU_STATUSES.STOP: {
		break
	}
}
