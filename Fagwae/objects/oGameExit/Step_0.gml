if surface_exists(board_surface) {
	var shard_count = floor(make_shard_count(time / period))
	var new_shard_count = (board_size - shard_count)
	if 0 < shard_count {
		draw_set_color(0)
		board.foreach_n(0, new_shard_count, board_filler)

		shard_done_count += new_shard_count
	}
	trace(shard_count)
	trace(new_shard_count)
}

if time < period {
	time += Delta
} else {
	time = period // limit to 1
	game_end()
}
