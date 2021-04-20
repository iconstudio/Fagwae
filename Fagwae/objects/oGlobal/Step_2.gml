/// @description Update the camera
var ratio = global.camera.zoom
var cam = camera_get_active()

if ratio == 1 {
	camera_set_view_size(cam, SCREEN_W, SCREEN_H)
} else {
	camera_set_view_size(cam, SCREEN_W * ratio, SCREEN_H * ratio)
}

global.__delta = delta_time * 0.000001
