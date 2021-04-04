/// @description script_stage3_ready()
/// @function script_stage3_ready
function script_stage3_ready() {
	area_delay_push(seconds(3))
	area_music_push(seconds(1), musicStage3)
	area_event_push(seconds(0.4), 15)
	area_delay_push(seconds(1))



}
