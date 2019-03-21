/// @description enemy_init_shape()
/// @function enemy_init_shape
// octagon 1s
enemy_register_general(enemy_octagon_1, oOctagonNormal, [sOctagonNormal, sOctagonExtreme], 12, 600, 1, 0, 8, $AE673C, $3C3CAE)

enemy_register_general(enemy_octagon_2, oOctagonStraight, [sOctagonNormal, sOctagonExtreme], 12, 500, 1, 0, 8, $AE673C, $3C3CAE)

enemy_register_general(enemy_octagon_3, oOctagonStraightUpper, [sOctagonNormal, sOctagonExtreme], 8, 800, 1, 0, 8, $AE673C, $3C3CAE)

enemy_register_general(enemy_octagon_4, oOctagonPawn, [sOctagonNormal, sOctagonExtreme], 10, 400, 1, 0, 8, $AE673C, $3C3CAE)

enemy_register_general(enemy_octagon_5, oOctagonJako, [sOctagonNormal, sOctagonExtreme], 16, 200, 1, 0, 8, $AE673C, $3C3CAE)

// hexagons
enemy_register_general(enemy_hexagon_1, oHexagonSpatial, [sHexagonNormal, sHexagonExtreme], 30, 1200, 1, 2, 6, $B77599, $7C1A7F)

enemy_register_general(enemy_hexagon_2, oHexagonFalling, [sHexagonNormal, sHexagonExtreme], 23, 1300, 1, 2.5, 6, $B77599, $7C1A7F)

// octagon 2s
enemy_register_general(enemy_spread_1, oOctagonSpreader, [sOctagonSpreaderNormal, sOctagonSpreaderExtreme],  45, 2000, 1, 0, 8, $389450, $3F6629)

enemy_register_general(enemy_spread_2, oOctagonArtillery, [sOctagonSpreaderNormal, sOctagonSpreaderExtreme],  60, 8000, 2, 0, 8, $389450, $3F6629)

// rectangles
enemy_register_general(enemy_rectangle_1, oRectangleLauncher, [sRectangleNormal, sRectangleExtreme],  20, 1600, 1, 1, 4, $4E58DE, $3E3EE8)

enemy_register_general(enemy_rectangle_2, oRectangleSidewinder, [sRectangleNormal, sRectangleExtreme],  37, 2000, 1, 0, 4, $4E58DE, $3E3EE8)

// boses
enemy_register_general(enemy_boss_1, oBoss1Core, [sBoss1A, sBoss1A], 900, 5400, 1, 0, 6, $B77599, $B77599)
enemy_register_general(enemy_boss_1A, oBoss1A, [sBoss1A, sBoss1A], 120, 540, 1, 0, 6, 0, 0)
enemy_register_general(enemy_boss_1B, oBoss1B, [sBoss1B, sBoss1B], 100, 540, 1, 0, 6, 0, 0)
enemy_register_general(enemy_boss_1C, oBoss1C, [sBoss1C, sBoss1C], 80, 540, 1, 0, 6, 0, 0)

enemy_register_general(enemy_boss_2, oBoss2Core, [sBoss2A, sBoss2A], 1000, 6000, 3, 0, 72, $3B3B3B, $3B3B3B)
enemy_register_general(enemy_boss_2B, oBoss2B, [sBoss2B, sBoss2B], 10000, 600, 1, 0, 6, $3B3B3B, $3B3B3B)
enemy_register_general(enemy_boss_2C, oBoss2C, [sBoss2C, sBoss2C], 3000, 600, 1, 0, 6, $3B3B3B, $3B3B3B)
