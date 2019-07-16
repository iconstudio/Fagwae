/// @description Initialization
image_xscale = screen_width * 0.03125
image_yscale = screen_height * 0.03125

game_pause()
selected = 0
mode = 0

await_time = 0
await_period = seconds(2)
appear_time = 0
appear_period = seconds(0.6)
popup_time = [0, -seconds(0.3)]
popup_period = [seconds(0.7), seconds(0.5)]
disappear_time = 0
disappear_period = seconds(0.8)
