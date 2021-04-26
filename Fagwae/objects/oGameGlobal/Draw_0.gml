/// @description Drawing the paused screen
if global.paused {
	if sprite_exists(capture) {
		draw_sprite(capture, 0, 0, 0)
	}
}
