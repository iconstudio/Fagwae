/// @description Dying

enemy_explode(3, 48, 2 + irandom(2), 0)

global.framekill_local++
instance_destroy()
