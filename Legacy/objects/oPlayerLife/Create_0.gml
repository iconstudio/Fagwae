image_xscale = 0.5
image_yscale = 0.5

speed = 3
direction = random(360)

alarm[0] = 15
enable = false
homing = false

alarm[1] = seconds(50)

brots = 0
bsurfx = 20
bsurfy = 16
bsurfw = bsurfx * 1.5
bsurfh = round(bsurfy * 1.5)
bsurf = -1
bsurf2 = -1

event_user(0)
event_user(1)

bleft = 16
bright = screen_width - 16
btop = 14
bbottom = screen_height - 8
blockable = true
