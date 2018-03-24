/// @description Shaking

screen_shake(min(3, irandom(deco_count + abs(deco_min))) + 3)
audio_play_sound(asset_get_index("soundCrack" + string(irandom(3) + 1)), 30, false)

if deco_count > deco_min
	alarm[4] = 6
