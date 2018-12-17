/// @description Update

var adiv = (0.25 + tsiz / 160)
nsiz += (tsiz - nsiz) / (12 * adiv)
psiz += (nsiz - psiz) / (8 * adiv)
osiz += (nsiz - osiz) / (16 * adiv)
if abs(psiz - tsiz) < 1
	instance_destroy()

event_user(0)
