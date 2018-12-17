/// @description screen_shake(value)
/// @function screen_shake
/// @param value { real }
with oGlobal {
	shake_meter = max(argument0, shake_meter)
	shake_time = shake_period
	if gamepad_index != -1 and !flag_is_mobile {
		var vibe = max(0.2, (shake_meter - 2) * 0.25) * 0.5
		gamepad_viberate(vibe)
	}
}
