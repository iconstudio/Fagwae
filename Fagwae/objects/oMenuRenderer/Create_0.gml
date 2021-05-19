render_target = null
render_target_prev = null


function change_render_target(menu) {
	if !is_null(render_target_prev)
		render_target_prev.mode = MENU_STATUSES.CLOSING
	if !is_null(menu)
		menu.mode = MENU_STATUSES.OPENING


	render_target_prev = render_target
	render_target = menu
}
