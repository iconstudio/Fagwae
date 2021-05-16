/// @description Drawing the score
draw_set_alpha(1)
draw_set_color($ffffff)
draw_set_font(fontScore)
draw_set_halign(1)
draw_set_valign(1)

var score_string = string(score_manager.value_virtual)
draw_text(SCORE_DX, SCORE_DY, score_string)


// TODO: reverse
var score_length = score_manager.get_size()
if  0 < score_length {
	ascore_dx = (SCORE_DX - 12 * (score_length - 1))
	score_manager.enumerate_all(function(i, caption) {
		draw_text(ascore_dx + i * 24, SCORE_DY + 40, caption)
	})
}
