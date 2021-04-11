event_inherited()

__children.push_back(0)

caption = "START"
parts_number = 25

// 인트로: 밑에서 기둥처럼 스프라이트 부속이 솟아나옴
// 전환: 부속들이 뒤집어지면서 사라졌다가, 다시 위로 뒤집어지면서 다른 곳에 나타남
// 나가기: 부속들이 뒤집어지면서 사라짐

set_open_1_duration(0.95)
set_open_2_duration(1.4)
tr_open_x = view_wport * 0.5
tr_open_y = view_hport * 0.2

shparts = function() constructor {
	this.image_alpha = 0
	this.pillar_time = 0
	this.pillar_period = 0.4

	this.image_index = 0
	this.xangle = 0
	this.xangle_temp = null
	this.bbox_top = 0
	this.flip_time = 0
	this.flip_period = 0.3

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

part_coords = new List()
var part_yoffsets = [
	32 + 29, 93 + 38, 47 + 22, 93 + 38, 93 + 24, 38 + 22, 85 + 18, 124 + 37, 143 + 28,
	124 + 6, 138 + 22, 172 + 8, 190 + 7, 26 + 5, 12 + 9, 19 + 5, 27 + 9, 21 + 29,
	81 + 18, 93 + 24, 143 + 29, 143 + 15, 175 + 12, 120 + 5, 133 + 20
]
	
var i, ff
for (var i = 0; i < parts_number; ++i) {
	ff = new shparts()
	ff.image_index = i
	ff.bbox_top = part_yoffsets[i] - 110
	part_coords.push_back(ff)
}

shuffle_parts = function() {
	part_coords.shuffle(0, parts_number)
}
shuffle_parts()
