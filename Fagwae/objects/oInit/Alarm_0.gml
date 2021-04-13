/// @description Go to the next room
window_set_position(window_get_x(), 30)

instance_create_layer(0, 0, layer, oGlobal)

global.camera = instance_create_layer(0, 0, layer, oCamera)

room_goto_next()
