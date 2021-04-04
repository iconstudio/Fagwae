/// @description Update
if await_time < await_period {
	await_time++
} else if appear_time < appear_period {
	appear_time++
} else {
	if popup_time[0] < popup_period[0]
		popup_time[0]++
	if popup_time[1] < popup_period[1]
		popup_time[1]++
}

if mode == 0 {
	
} else {
	if disappear_time < disappear_period {
		disappear_time++
	} else {
		instance_destroy()
	}
}
