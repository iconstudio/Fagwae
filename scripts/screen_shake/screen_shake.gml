/// @description screen_shake(value)
/// @function screen_shake
/// @param value { real }

global.screenshake = max(argument0, global.screenshake)
if gamepad_index != -1 and !global.flag_is_mobile {
	var vibe = max(0.2, (global.screenshake - 2) * 0.25) * 0.5
	gamepad_viberate(vibe)
}
