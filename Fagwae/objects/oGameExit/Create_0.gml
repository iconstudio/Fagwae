board_surface = surface_create(SCREEN_W, SCREEN_H)
surface_set_target(board_surface)
draw_clear_alpha($ffffff, 0)
surface_reset_target()

board = new List()
board_size = global.shard_w_count * global.shard_h_count
board.reserve(board_size)
board_filler = method(self, function(shard) {
	surface_set_target(board_surface)
	draw_rectangle(shard.x, shard.y, shard.x + 8, shard.y +8, false)
	surface_reset_target()
})

board_pick = [board_size * 0.2, board_size * 0.3, board_size * 0.55, board_size - 1]

var i, j, shard
for (j = 0; j < global.shard_h_count; ++j) {
	for (i = 0; i < global.shard_w_count; ++i) {
		shard = new global.ScreenShard(i * 8, j * 8)

		board.push_back(shard)
	}
}
board.shuffle(0, board.get_size())


time = 0
period = (2)


shard_done_count = 0
make_shard_count = function(progress) {
	return bezier4(board_pick[0], board_pick[1], board_pick[2], board_pick[3], progress)
}
