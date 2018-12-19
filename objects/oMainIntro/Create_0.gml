intro_subsize = 2
intro_mode = 0

slide_exceed = 400
slide_exceed_left = slide_exceed
slide_exceed_fill = slide_exceed_left * 2
slide_dx = room_width * 0.5 - slide_exceed_left

slide_time = 0 // first
slide_period = seconds(0.7)
slide_wait_time = 0
slide_wait_period = seconds(0.01)
zoom_before_time = 0 // second
zoom_before_period = seconds(0.2)
zoom_time = 0 // second
zoom_period = seconds(0.2)
centering_time = 0 // third
centering_period = seconds(0.4)

// title
title_texture = sprite_get_texture(sTitle, 0)
title_yposition = room_height * 0.5 - 70
title_pos_tleft = room_width * 0.5 - 197
title_pos_tright = room_width * 0.5 + 198
title_pos_bleft = room_width * 0.5 - 230
title_pos_bright = room_width * 0.5 + 230
title_pos_top = room_height * 0.5 - 32
title_pos_bottom = room_height * 0.5 + 72
