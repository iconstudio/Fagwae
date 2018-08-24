/// @description script_stage1_ready()
/// @function script_stage1_ready

area_delay_push(seconds(0.5))
area_music_push(seconds(1), musicStage1)

area_delay_push(seconds(4))
area_event_push(seconds(0.4), 15)
area_delay_push(seconds(1))

area_delay_push(seconds(2))
if !global.status_tutorial {
	area_message_push(seconds(1), "ARROW KEY TO MOVE", global.screen_gui_cx, global.screen_gui_cy)
	area_message_push(0, "Z KEY TO ATTACK", global.screen_gui_cx, global.screen_gui_cy)
}
global.status_tutorial = true
