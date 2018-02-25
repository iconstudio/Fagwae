/// @description enemy_init_shape()
/// @function enemy_init_shape

// octagon 1s
enemy_register(enemy_octagon_1, oOctagonNormal, "OCTAGON", sOctagonNormal, sOctagonExtreme, 
12, 600, 1, 0, 8, make_color_rgb(60, 103, 174), make_color_rgb(174, 60, 60))

enemy_register(enemy_octagon_2, oOctagonStraight, "OCTAGON", sOctagonNormal, sOctagonExtreme, 
12, 500, 1, 0, 8, make_color_rgb(60, 103, 174), make_color_rgb(174, 60, 60))

enemy_register(enemy_octagon_3, oOctagonStraightUpper, "OCTAGON", sOctagonNormal, sOctagonExtreme, 
8, 800, 1, 0, 8, make_color_rgb(60, 103, 174), make_color_rgb(174, 60, 60))

enemy_register(enemy_octagon_4, oOctagonPawn, "OCTAGON", sOctagonNormal, sOctagonExtreme, 
10, 400, 1, 0, 8, make_color_rgb(60, 103, 174), make_color_rgb(174, 60, 60))

// hexagons
enemy_register(enemy_hexagon_1, oHexagonSpatial, "HEXAGON", sHexagonNormal, sHexagonExtreme, 
30, 1200, 1, 2, 6, make_color_rgb(153, 117, 183), make_color_rgb(127, 26, 124))

enemy_register(enemy_hexagon_2, oHexagonFalling, "HEXAGON", sHexagonNormal, sHexagonExtreme, 
23, 1300, 1, 2.5, 6, make_color_rgb(153, 117, 183), make_color_rgb(127, 26, 124))

// octagon 2s
enemy_register(enemy_spread_1, oOctagonSpreader, "SPREADING OCTAGON", sOctagonSpreaderNormal, sOctagonSpreaderExtreme, 
45, 2000, 1, 0, 8, make_color_rgb(80, 148, 56), make_color_rgb(41, 102, 63))

enemy_register(enemy_spread_2, oOctagonArtillery, "SPREADING OCTAGON", sOctagonSpreaderNormal, sOctagonSpreaderExtreme, 
70, 8000, 2, 0, 8, make_color_rgb(80, 148, 56), make_color_rgb(41, 102, 63))

// rectangles
enemy_register(enemy_rectangle_1, oRectangleLauncher, "RECTANGLE", sRectangleNormal, sRectangleExtreme, 
20, 1600, 1, 1, 4, make_color_rgb(222, 88, 78), make_color_rgb(232, 62, 62))

enemy_register(enemy_rectangle_2, oRectangleSidewinder, "RECTANGLE", sRectangleNormal, sRectangleExtreme, 
37, 2000, 1, 0, 4, make_color_rgb(222, 88, 78), make_color_rgb(232, 62, 62))

// circles
enemy_register(enemy_circle_1, oCircleSplitter, "CIRCLE", sCircleNormal, sCircleExtreme, 
40, 3000, 2, 0, 72, $808080, $60687F)

enemy_register(enemy_circle_2, oCircleJumper, "CIRCLE", sCircleNormal, sCircleExtreme, 
22, 2000, 2, 0, 72, $808080, $60687F)

enemy_register(enemy_circle_3, oCircleSplitter, "CIRCLE", sCircleNormal, sCircleExtreme, 
26, 2800, 2, 0, 72, $808080, $60687F)
