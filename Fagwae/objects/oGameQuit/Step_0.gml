if surface_exists(board_surface) {
	var shard_count = floor(make_shard_count(time / period))
	var new_shard_count = max(0, shard_count - board_progress)

	if 0 < shard_count {
		draw_set_alpha(1)
		draw_set_color(0)
		board.foreach_n(board_progress, new_shard_count, board_filler)

		board_progress = shard_count
	}
}

if time < period {
	time += Delta
} else {
	time = period // limit to 1
	if !done {
		alarm[0] = seconds(0.4)
		done = true
	}
}
