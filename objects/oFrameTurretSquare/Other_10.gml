/// @description Dying

with turret {
  hp = 0
  parent = noone
  event_user(15)
}

enemy_explode(7, 72, 4 + irandom(2), 0)
instance_destroy()
