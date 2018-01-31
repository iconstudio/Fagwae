/// @description 

var _fr = floor(frame)
var _frt = frame - _fr
var _nfr
if _fr < frame
	_nfr = _fr + 1
else
	_nfr = frame

image_blend = make_color_rgb(cr[_fr] + (cr[_nfr] - cr[_fr]) * _frt, cg[_fr] + (cg[_nfr] - cg[_fr]) * _frt, cb[_fr] + (cb[_nfr] - cb[_fr]) * _frt)
image_alpha = ca[_fr] + (ca[_nfr] - ca[_fr]) * _frt

if frame < frame - cspd
	frame += cspd
else
	instance_destroy()

event_user(0)
