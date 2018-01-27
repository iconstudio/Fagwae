/// @description Initialization

trigger_push = ds_queue_create()
trigger_size = 0
trigger_counter = 0
trigger_datalast = []

prohibit_push = []
prohibit_count = 0
//eint[0] = oEnemyBossHexagonMiddle
//eint[1] = oEnemyBossPlatformMiddle

//entrance = instance_create(0, -76, objAreaEntrance)
instance_last = noone
