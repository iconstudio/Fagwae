if await_time < await_period {
	await_time++
} else if fadeout_time < fadeout_period {
	fadeout_time++
} else if popup_time < popup_period {
	popup_time++
} else if popup_await_time < popup_await_period {
	popup_await_time++
} else if end_time < end_period {
	if end_time == 0 {
		with oDrawnSprite
			instance_destroy()
		screen_shake(10)
	}
	end_time++
} else {
	room_goto(roomMain)
}
