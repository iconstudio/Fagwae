player_layer = layer_get_id("player")
player_generator = layer_sequence_create(player_layer, SCREEN_W * 0.5, SCREEN_H * 0.5, seqPlayerInit)


capture = -1


event_user(0)


key_anchor = NONE
key_pin_stop = false
key_pin_duration = -1
key_pin_period_short = 0.1
key_pin_period_long = 0.5
key_pinned = NONE

