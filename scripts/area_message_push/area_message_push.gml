/// @description area_message_push(time_delay, caption, cx, cy)
/// @function area_message_push
/// @param time_delay { real }
/// @param caption { string }
/// @param cx { real }
/// @param cy { real }
function area_message_push(argument0, argument1, argument2, argument3) {
	area_trigger_push(trigger.message, argument0, argument1, 0, argument2, argument3)



}
