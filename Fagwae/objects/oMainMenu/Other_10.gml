/// @description Declare the menu components
Menu()
set_open(true)

function MainMenuProp(): MenuEntry() constructor {
	this.sprite_index = null
	this.__h = 74
}

with add_menu_item(new MainMenuProp()) {
	this.sprite_index = sMainMenuFrameStart
	this.xstart = 441
	this.ystart = 492
	this.__x = this.xstart
	this.__y = this.ystart
	this.__caption = "START"
	this.__inumber = 25

	set_transition_duration(1.2)

	// 인트로: 밑에서 기둥처럼 스프라이트 부속이 솟아나옴
	INTRO = 0
	this.intro_time = 0
	this.intro_perid = 1

	NORMAL = 10

	// 전환: 부속들이 뒤집어지면서 사라졌다가, 다시 위로 뒤집어지면서 다른 곳에 나타남
	TRANSITION = 20
	this.transition_x = view_wport * 0.5
	this.transition_y = view_hport * 0.1
	this.transition_mid_time = 0
	this.transition_mid_preiod = 0.6

	// 나가기: 부속들이 뒤집어지면서 사라짐
	OUT_START = 80
	OUT_TITLE = 82
	GAME_START_READY = 90
	GAME_START = 92
	this.out_time = 0
	this.out_period = 2.6
	this.mode = INTRO

	this.shparts = function() constructor {
		this.image_alpha = 0
		this.pillar_time = 0
		this.pillar_period = 0.4

		this.image_index = 0
		this.xangle = 0

		this.x = 0
		this.ystart = 100
		this.y = ystart
		this.dx = 0
		this.dy = 0

		this.speed = 0.55 // pixel per second
		this.move_time = 2
		this.move_period_min = 0.7
		this.move_period_max = 1.4
	}

	this.part_coords = new List()
	var i, ff
	for (var i = 0; i < __inumber; ++i) {
		ff = new shparts()
		ff.image_index = i
		this.part_coords.push_back(ff)
	}
	this.part_coords.shuffle(0, __inumber)

	this.do_update = function() {
		if __transition { // outgoing mode
			var trans_ratio = __trans_time / __trans_period
			if __trans_mode == MENU_MODES.OPEN {
				var trans_mid_ratio = transition_mid_time / transition_mid_preiod
				var trans_late_ratio = (__trans_time - transition_mid_preiod) / (__trans_period - transition_mid_preiod)

				if transition_mid_time < transition_mid_preiod { // fadeout
					
					transition_mid_time += Delta
				} else { // fadein to new position
					
				}
			}
		} else { // interactive mode
			switch mode {
				case INTRO:
					var intro_ratio = intro_time / intro_perid
					if intro_ratio < 1 { // the part pillars are getting high up
						var intro_index = min(3 + ease.out_quart(intro_ratio) * __inumber, __inumber)

						part_coords.foreach_n(0, intro_index, function(part) {
							with part {
								var pillar_ratio = pillar_time / pillar_period
								if pillar_ratio < 1 {
									image_alpha = lerp(0, 1, ease.in_circ(pillar_ratio))
									y = lerp(ystart, 0, ease.out_cubic(pillar_ratio))
									pillar_time += Delta
								} else {
									image_alpha = 1
									y = 0
								}
							}
						})

						intro_time += Delta
					} else {
						part_coords.foreach_all(function(part) { // debug
							part.image_alpha = 1
							part.y = 0
						})

						mode = NORMAL
						print("To normal mode")
					}
				break

				case NORMAL:
					part_coords.foreach_all(function(part) {
						with part {
							move_time += Delta

							var chx, chy, fdist, fdir
							if irandom_range(move_period_min, move_period_max) < move_time {
								move_time = 0
								dx = random_range(-6, 8)
								dy = random_range(-5, 5)
							}

							chx = dx - x
							chy = dy - y
							if chx != 0 or chy != 0 {
								fdist = point_distance(0, 0, chx, chy)
								fdir = point_direction(0, 0, chx, chy)
								if fdist < speed {
									x = dx
									y = dy
								} else {
									x += lengthdir_x(speed, fdir)
									y += lengthdir_y(speed, fdir)
								}
							}
						}
					})
				break

				default:
					throw "No state specified for main menu!"
			}
		}
	}

	this.do_draw = function() {
		if mode == INTRO {
			part_coords.foreach_all(function(part) {
				var oalpha = part.image_alpha, dalpha
				if oalpha < 0.5 {
					dalpha = oalpha * 1.6 // ~0.8
				} else {
					dalpha = 0.8 - oalpha * 2
				}

				var dx = __x, dy = __y
				with part
					draw_sprite_ext(sMainMenuFrameStartIntro, image_index, dx + x, dy + y, 1, 1, 0, $ffffff, dalpha)
			})
		}
		
		part_coords.foreach_all(function(part) {
			var dx = __x, dy = __y
			with part
				draw_sprite_ext(sMainMenuFrameStart, image_index, dx + x, dy + y, 1, 1, 0, $ffffff, image_alpha)
		})
	}

	add_text("On", 0, 0)
	
	focus()
}
