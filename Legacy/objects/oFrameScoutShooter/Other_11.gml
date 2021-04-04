/// @description Creation
event_perform_object(oFrameScout, ev_other, ev_user1)

shot_count = 0
shot_speed = enemy_bullet_speed_faster
shot_period = seconds(1.2 - global.stage * 0.06 - global.extreme * 0.2)
alarm[0] = seconds(1 - global.extreme * 0.4)
