/// @function ObjectChain()
function ObjectChain() {
	och_arms = new List()
}


function ArmDataOrientation(ax, ay, distance, direction, angle) constructor {
	this.anchorx = ax
	this.anchory = ay
	this.distance = distance
	this.direction = direction
	this.image_angle = angle
}


function ArmDataCoord(ax, ay) {
	
	
	var Result = ArmDataOrientation(ax, ay, point_distance(ox, oy, x, y), point_direction(ox, oy, x, y))
	return Result
}



function Arm(attach, instance, coord_data) constructor {
	this.mother = attach
	this.layer = instance.layer

	if is_struct(coord_data) {
		
	} else {
		
	}

	static update = function() {
		
	}
}


function arm_add() {
	
}
