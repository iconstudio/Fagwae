/// @description Drawing the UI and paused screen
if global.screenlock {
	if sprite_exists(capture) {
		draw_sprite(capture, 0, 0, 0)
	}
}
