/// @description screen_shake(value)
/// @function screen_shake
/// @param value { real }
with oGlobal {
	shake_meter = max(argument0, shake_meter)
	if shake_meter > 12
		shake_period = seconds(log2(shake_meter - 12) / shake_meter + 0.06)
	else
		shake_period = seconds(0.05)
	shake_time = shake_period
	if gamepad_index != -1 and !global.flag_is_mobile {
		var vibe = max(0.2, (shake_meter - 2) * 0.25) * 0.1
		gamepad_viberate(vibe)
	}
}
