/// @description script_stage1_ready()
/// @function script_stage1_ready
area_delay_push(seconds(0.5))
area_music_push(seconds(1), musicStage1)

area_delay_push(seconds(4))
area_event_push(seconds(0.4), 15)
area_delay_push(seconds(1))

if !global.status_tutorial {
	area_delay_push(seconds(2))
	area_message_push(seconds(1.85), "ARROW KEY TO MOVE", screen_width * 0.5, screen_height * 0.5)
	area_message_push(seconds(1.85), "Z KEY TO ATTACK", screen_width * 0.5, screen_height * 0.5)
}
global.status_tutorial = true
