var pd = image_angle
var lhx = x + lengthdir_x(29, pd) // head
var lhy = y + lengthdir_y(29, pd)
var lrx = x + lengthdir_x(29, pd - 180) // rear
var lry = y + lengthdir_y(29, pd - 180)

if global.extreme {
	enemy_shot(lrx, lry, shot_speed, pd - 160, oEnemyBullet2)
	enemy_shot(lhx, lhy, shot_speed, pd - 20, oEnemyBullet2)
	enemy_shot(lrx, lry, shot_speed, pd - 220)
	enemy_shot(lhx, lhy, shot_speed, pd + 60)
} else {
	enemy_shot(lrx, lry, shot_speed, pd - 180)
	enemy_shot(lhx, lhy, shot_speed, pd)
}
alarm[0] = shot_period
