/// @description Dying

dead = true
screen_shake(14 + random(2))

global.framekill_local++
instance_destroy()
