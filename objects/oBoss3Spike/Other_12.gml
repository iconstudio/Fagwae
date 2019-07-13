/// @description Update
if oBoss3Core.pattern == 0
	image_xscale = beat_xscale + beat_xscale_addition * oBoss3Core.pattern00_time / oBoss3Core.pattern00_period
else
	image_xscale = beat_xscale
