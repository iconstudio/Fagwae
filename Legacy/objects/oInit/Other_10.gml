/// @description Defining macros
// constants for triggers of the area
enum trigger {
	object, enemy,
	message, script, global, userevent,
	music,
	delay
}
#macro LEFT 0
#macro RIGHT 1

/// shapes
// normal sizes
#macro enemy_octagon_1			"eoctagon1"		// shots 1x5 (blue octagon mk.1)
#macro enemy_octagon_2			"eoctagon2"		// shots 1-1, 3 times (blue octagon mk.2)
#macro enemy_octagon_3			"eoctagon3"		// goes up while shots 3, 3 times (blue octagon mk.3)
#macro enemy_octagon_4			"eoctagon4"		// shots 1, 3 times (blue octagon mk.4)
#macro enemy_octagon_5			"eoctagon5"		// jako (blue octagon mk.5)
#macro enemy_hexagon_1			"ehexagon1"		// shots 1 for each 3 arm_number, 1 times (purple hexagon mk.1)
#macro enemy_hexagon_2			"ehexagon2"		// falls while shots 1 for each 3 arm_number, 1 times (purple hexagon mk.2)
#macro enemy_spread_1			"espread1"		// shots 4, 16 times, and change (green octagon mk.1)
#macro enemy_spread_2			"espread2"		// shots 4, 3 times (green octagon mk.2)
#macro enemy_rectangle_1		"erect1"			// shots 1, 4 times (coral rectangle mk.1)
#macro enemy_rectangle_2		"erect2"			// (coral rectangle mk.2)

/// frames
// singles
#macro enemy_triangle_1		"ftriangle1"	// falls
#macro enemy_triangle_2		"ftriangle2"	// falls from side
#macro enemy_line_1				"fline1"			// falls while getting closer to player
#macro enemy_line_2				"fline2"			// falls
#macro enemy_board_1				"fboard1"			// line of cannons
#macro enemy_piece_1				"fpiece1"			// falls

// joints
#macro enemy_joint_1				"fjoint1"			// linking parts
#macro enemy_joint_2				"fjoint2"			// linking parts
#macro enemy_joint_3				"fjoint3"			// linking parts (invincible)
#macro enemy_joint_s1			"fjoins1"			// linking parts
#macro enemy_joint_s2			"fjoins2"			// linking parts
//#macro enemy_crawler_leg		"fcrlleg"			// a leg of the crawler
//#macro enemy_crawler_foot	"fcrlfut"			// a foot of the crawler

// small multiples
#macro enemy_square_1			"fsquare1"		// square
#macro enemy_square_2			"fsquare2"		// square with a turret
#macro enemy_square_3			"fsquare3"		// square which randomly rotated
#macro enemy_square_4			"fsquare4"		// square which randomly rotated with a turret
#macro enemy_square_5			"fsquare5"		// square with a dual turret
#macro enemy_square_6			"fsquare6"		// square for pile
#macro enemy_square_h			"fsquareh"		// square with a hammer
#macro enemy_scout_j1			"fscout1"			// follows a path
#macro enemy_scout_c1			"fscoutcaptain1" // captain scout follows a path while shots 1
#macro enemy_scout_j2			"fscout2"			// follows a path while shots 1-1
#macro enemy_scout_c2			"fscoutcaptain2" // same but 1-1-1
#macro enemy_scout_j3			"fscout3"			// falls a little then falls faster
#macro enemy_scout_j4			"fscout4"			// falls a little then shots 1 then falls faster

// large multiples
#macro enemy_piles_1				"fpiles1"			// a bunch of turrets
#macro enemy_crab_1				"fcrab1"			// appear from side, shots 1-1-1, 3 times, and go ahead (remain longer)
#macro enemy_crab_2				"fcrab2"			// appear from side, shots 1-1-1, 3 times, and go ahead
#macro enemy_crab_3				"fcrab3"			// falls while shots 3
#macro enemy_octopod_1			"foctopod1"		// falls while shots 1, more than or equal to 3 times
#macro enemy_octopod_2			"foctopod2"		// falls while shots, multiple times
#macro enemy_octopod_3			"foctopod3"		// swims random points in the screen, then charges
#macro enemy_crawler_1			"fcrawler1"		// crawler
#macro enemy_crawler_2			"fcrawler2"		// faster crawler

/// indeterminates
#macro enemy_rapid_1				"irapid1"			// shots 3 fast and tracks player
#macro enemy_rapid_2				"irapid2"			// shots 3 fast, randomly path
#macro enemy_rapid_3				"irapid3"			// shots 1 fast, launched by boss
#macro enemy_emitter_1			"iemit1"			// launches 4 arms and reloads

/// arms
#macro enemy_arm_hexagon_1		"ahexagon1"
#macro enemy_arm_spread_1		"aspread1"
#macro enemy_arm_rectangle_1 "arect1"
#macro enemy_arm_rectangle_2 "arect2"
#macro enemy_arm_turret_1		"aturret1"		// is_static -> dynamic in extreme, slow
#macro enemy_arm_turret_2		"aturret2"		// dynamic, slow
#macro enemy_arm_turret_3		"aturret3"		// dynamic, fast
#macro enemy_arm_turret_4		"aturret4"		// boss 1
#macro enemy_arm_turret_5		"aturret5"		// boss 2
#macro enemy_arm_turret_6		"aturret6"		// always homing turret
#macro enemy_arm_turret_d		"aturretd"		// dual
#macro enemy_arm_hammer			"ahammer"			// body
#macro enemy_arm_handle			"ahandle"			// handle
#macro enemy_arm_hammerhead	"ahhead"			// head
#macro enemy_arm_crawler_terminal		"acrawlh"			// head and tail
#macro enemy_arm_crawler_leg	"acrawll"			// legs
#macro enemy_arm_crawler_foot	"acrawlf"		// foot

#macro enemy_boss_1								"eboss1"
#macro enemy_boss_1A								"eboss1a"
#macro enemy_boss_1B								"eboss1b"
#macro enemy_boss_1C								"eboss1c"
#macro enemy_boss_2								"eboss2"
#macro enemy_boss_2B								"eboss2b"
#macro enemy_boss_2C								"eboss2c"
#macro enemy_boss_3								"eboss3body"
#macro enemy_boss_3_turret					"eboss3head"
#macro enemy_boss_3_plate					"eboss3armour"
#macro enemy_boss_3_backplate			"eboss3armourback"
#macro enemy_boss_3_sholuder				"eboss3sholuder"
#macro enemy_boss_3_arm						"eboss3arm"
#macro enemy_boss_3_pincher				"eboss3pincher"
#macro enemy_boss_3_finger					"eboss3finger"
#macro enemy_boss_3_vent						"eboss3shootingvent"
#macro enemy_boss_3_propellerarm		"eboss3propellerarm"
#macro enemy_boss_3_spike					"eboss3spike"
#macro enemy_boss_4								"eboss4"
#macro enemy_boss_5								"eboss5"
#macro enemy_boss_6								"eboss6"
