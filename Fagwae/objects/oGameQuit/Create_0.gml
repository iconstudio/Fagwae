board = new List()
board_progress = 0
board_size = global.shard_w_count * global.shard_h_count
board_pick = [0, board_size * 0.2, board_size * 0.45, board_size]


board_surface = surface_create(SCREEN_W, SCREEN_H)
surface_set_target(board_surface)
draw_clear_alpha($ffffff, 0)
surface_reset_target()


var i, j, shard
for (j = 0; j < global.shard_h_count; ++j) {
	for (i = 0; i < global.shard_w_count; ++i) {
		shard = [i * global.shard_size, j * global.shard_size]

		board.push_back(shard)
	}
}
board.shuffle(0, board.get_size())
trace(board.get_size())


make_shard_count = function(progress) {
	//return progress * board_size
	return bezier4(board_pick[0], board_pick[1], board_pick[2], board_pick[3], progress)
}

board_filler = method(self, function(shard) {
	if !is_array(shard)
		exit

	var dx = shard[0], dy = shard[1]
	surface_set_target(board_surface)
	draw_rectangle(dx, dy, dx + global.shard_size, dy + global.shard_size, false)
	surface_reset_target()
})


instance_deactivate_object(oDrawnSprite)
capture = sprite_create_from_surface(application_surface, 0, 0, SCREEN_W, SCREEN_H, false, false, 0, 0)


time = 0
period = (1.5)
done = false
