if pvalue != value	 {
	var scroll_value = ui_lerp_filter(value, minimum, maximum)
	var scroll_x = scroll_value * (ui_width - 16) + 8

	cell.ui_x = scroll_x
	pvalue = value
 
	if callback >= 0
		script_execute(callback, id, value)
}

