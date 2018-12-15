/// @description enemy_init_shape()
/// @function enemy_init_shape

// octagon 1s
enemy_register(enemy_octagon_1, oOctagonNormal, "OCTAGON", sOctagonNormal, sOctagonExtreme, 
12, 600, 1, 0, 8, $AE673C, $3C3CAE)

enemy_register(enemy_octagon_2, oOctagonStraight, "OCTAGON", sOctagonNormal, sOctagonExtreme, 
12, 500, 1, 0, 8, $AE673C, $3C3CAE)

enemy_register(enemy_octagon_3, oOctagonStraightUpper, "OCTAGON", sOctagonNormal, sOctagonExtreme, 
8, 800, 1, 0, 8, $AE673C, $3C3CAE)

enemy_register(enemy_octagon_4, oOctagonPawn, "OCTAGON", sOctagonNormal, sOctagonExtreme, 
10, 400, 1, 0, 8, $AE673C, $3C3CAE)

enemy_register(enemy_octagon_5, oOctagonJako, "OCTAGON", sOctagonNormal, sOctagonExtreme, 
16, 200, 1, 0, 8, $AE673C, $3C3CAE)

// hexagons
enemy_register(enemy_hexagon_1, oHexagonSpatial, "HEXAGON", sHexagonNormal, sHexagonExtreme, 
30, 1200, 1, 2, 6, $B77599, $7C1A7F)

enemy_register(enemy_hexagon_2, oHexagonFalling, "HEXAGON", sHexagonNormal, sHexagonExtreme, 
23, 1300, 1, 2.5, 6, $B77599, $7C1A7F)

// octagon 2s
enemy_register(enemy_spread_1, oOctagonSpreader, "SPREADING OCTAGON", sOctagonSpreaderNormal, sOctagonSpreaderExtreme, 
45, 2000, 1, 0, 8, $389450, $3F6629)

enemy_register(enemy_spread_2, oOctagonArtillery, "SPREADING OCTAGON", sOctagonSpreaderNormal, sOctagonSpreaderExtreme, 
60, 8000, 2, 0, 8, $389450, $3F6629)

// rectangles
enemy_register(enemy_rectangle_1, oRectangleLauncher, "RECTANGLE", sRectangleNormal, sRectangleExtreme, 
20, 1600, 1, 1, 4, $4E58DE, $3E3EE8)

enemy_register(enemy_rectangle_2, oRectangleSidewinder, "RECTANGLE", sRectangleNormal, sRectangleExtreme, 
37, 2000, 1, 0, 4, $4E58DE, $3E3EE8)

// circles
enemy_register(enemy_circle_1, oCircleSplitter, "CIRCLE", sCircleNormal, sCircleExtreme, 
40, 3000, 2, 0, 72, $808080, $60687F)

enemy_register(enemy_circle_2, oCircleJumper, "CIRCLE", sCircleNormal, sCircleExtreme, 
22, 2000, 2, 0, 72, $808080, $60687F)

// boses
enemy_register(enemy_boss_1, oBoss1Core, "SUPER HEXAGON", sBoss1A, sBoss1A, 
900, 5400, 1, 0, 6, $B77599, $B77599)
enemy_register(enemy_boss_1A, oBoss1A, "SUPER HEXAGON", sBoss1A, sBoss1A, 
120, 540, 1, 0, 6, 0, 0)
enemy_register(enemy_boss_1B, oBoss1B, "SUPER HEXAGON", sBoss1B, sBoss1B, 
100, 540, 1, 0, 6, 0, 0)
enemy_register(enemy_boss_1C, oBoss1C, "SUPER HEXAGON", sBoss1C, sBoss1C, 
80, 540, 1, 0, 6, 0, 0)

enemy_register(enemy_boss_2, oBoss2Core, "SUPER CIRCLE", sBoss2A, sBoss2A, 
1000, 6000, 3, 0, 72, $3B3B3B, $3B3B3B)
enemy_register(enemy_boss_2B, oBoss2B, "SHIELD", sBoss2B, sBoss2B, 
10000, 600, 1, 0, 6, $3B3B3B, $3B3B3B)
enemy_register(enemy_boss_2C, oBoss2C, "ANGULAR", sBoss2C, sBoss2C, 
3000, 600, 1, 0, 6, $3B3B3B, $3B3B3B)
