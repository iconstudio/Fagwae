/// @description Update
if parent.pattern == 0
	image_xscale = beat_xscale + beat_xscale_addition * parent.pattern00_time / parent.pattern00_period
else
	image_xscale = beat_xscale
