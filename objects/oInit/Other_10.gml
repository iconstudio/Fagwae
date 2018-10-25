/// @description Defining macros

// constants for triggers of the area
#macro areapush_object 0
#macro areapush_enemy 1
#macro areapush_message 2
#macro areapush_script 3
#macro areapush_global 4
#macro areapush_music 5
#macro areapush_userevent 6
#macro areapush_delay 7
#macro LEFT 0
#macro RIGHT 1

/// shapes
// normal sizes
#macro enemy_octagon_1		"eoctagon1"		// shots 5 (blue octagon mk.1)
#macro enemy_octagon_2		"eoctagon2"		// shots 3, 3 times (blue octagon mk.2)
#macro enemy_octagon_3		"eoctagon3"		// goes up while shots 3, 3 times (blue octagon mk.3)
#macro enemy_octagon_4		"eoctagon4"		// shots 1, 3 times (blue octagon mk.4)
#macro enemy_hexagon_1		"ehexagon1"		// shots 1 for each 3 arm_number, 1 times (purple hexagon mk.1)
#macro enemy_hexagon_2		"ehexagon2"		// falls while shots 1 for each 3 arm_number, 1 times (purple hexagon mk.2)
#macro enemy_spread_1			"espread1"		// shots 4, 16 times, and change (green octagon mk.1)
#macro enemy_spread_2			"espread2"		// shots 4, 3 times (green octagon mk.2)
#macro enemy_rectangle_1	"erect1"			// shots 1, 4 times (coral rectangle mk.1)
#macro enemy_rectangle_2	"erect2"			// (coral rectangle mk.2)
#macro enemy_circle_1			"ecircle1"		// shots 12 around (gray circle mk.1)
#macro enemy_circle_2			"ecircle2"		// Jumping while shots 3 or shots 12 around (gray circle mk.2)

/// frames
// singles
#macro enemy_triangle_1		"ftriangle1"	// falls
#macro enemy_triangle_2		"ftriangle2"	// falls from side
#macro enemy_line_1				"fline1"			// falls while getting closer to player
#macro enemy_line_2				"fline2"			// falls
#macro enemy_board_1			"fboard1"			// line of cannons
#macro enemy_piece_1			"fpiece1"			// falls

// joints
#macro enemy_joint_1			"fjoint1"			// linking parts
#macro enemy_joint_2			"fjoint2"			// linking parts
#macro enemy_joint_3			"fjoint3"			// linking parts (invincible)
#macro enemy_joint_s1			"fjoins1"			// linking parts
#macro enemy_joint_s2			"fjoins2"			// linking parts

// small multiples
#macro enemy_square_1			"fsquare1"		// square
#macro enemy_square_2			"fsquare2"		// square with a turret
#macro enemy_square_3			"fsquare3"		// square which randomly rotated
#macro enemy_square_4			"fsquare4"		// square which randomly rotated with a turret
#macro enemy_square_5			"fsquare5"		// square with a dual turret
#macro enemy_square_h			"fsquareh"		// square with a hammer

// large multiples
#macro enemy_octopod_1		"foctopod1"		// falls while shots 1, more than or equal to 3 times
#macro enemy_octopod_2		"foctopod2"		// falls while shots, multiple times
#macro enemy_octopod_3		"foctopod3"		// swims random points in the screen, then charges
#macro enemy_crab_1				"fcrab1"			// falls while shots 3
#macro enemy_crab_2				"fcrab2"			// appear from side, shots 1, and go ahead
#macro enemy_crawler_1		"fcrawler1"		// crawler
#macro enemy_crawler_2		"fcrawler2"		// crawler with a turret

/// indeterminates
#macro enemy_rapid_1			"irapid1"			// shots 3 fast and tracks player
#macro enemy_rapid_2			"irapid2"			// shots 3 fast, randomly path
#macro enemy_rapid_3			"irapid3"			// shots 1 fast, launched by boss
#macro enemy_emitter_1		"iemit1"			// launches 4 arms and reloads

/// arms
#macro enemy_arm_hexagon_1 "ahexagon1"
#macro enemy_arm_spread_1 "aspread1"
#macro enemy_arm_rectangle_1 "arect1"
#macro enemy_arm_rectangle_2 "arect2"
#macro enemy_arm_turret_1 "aturret1"		// static -> dynamic in extreme, slow
#macro enemy_arm_turret_2 "aturret2"		// dynamic, slow
#macro enemy_arm_turret_3 "aturret3"		// dynamic, fast
#macro enemy_arm_turret_4 "aturret4"		// boss 1
#macro enemy_arm_turret_5 "aturret4"		// boss 2
#macro enemy_arm_turret_d "aturretd"		// dual
#macro enemy_arm_hammer		"ahammer"			// body
#macro enemy_arm_handle		"ahandle"			// handle
#macro enemy_arm_hammerhead	"ahhead"		// head

#macro enemy_boss_1 "eboss1"
#macro enemy_boss_1A "eboss1a"
#macro enemy_boss_1B "eboss1b"
#macro enemy_boss_1C "eboss1c"
#macro enemy_boss_2 "eboss2"
#macro enemy_boss_2A "eboss2a"
#macro enemy_boss_2B "eboss2b"
#macro enemy_boss_2C "eboss2c"
#macro enemy_boss_3 "eboss3"
#macro enemy_boss_4 "eboss4"
#macro enemy_boss_5 "eboss5"
#macro enemy_boss_6 "eboss6"
