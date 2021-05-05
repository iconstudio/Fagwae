/// @function Scene(asset, [x=0], [y=0], [layer=layer])
function Scene(sequence) constructor {
	if !sequence_exists(sequence)
		throw string(sequence) + " is not a sequence! "


	this.x = 0
	this.y = 0
	this.layer = other.layer

	if 1 < argument_count {
		this.x = argument[1]
		if 2 < argument_count {
			this.y = argument[2]
			if 3 < argument_count {
				if is_string(argument[3])
					this.layer = layer_get_id(argument[3])
				else
					this.layer = argument[3]
			}
		}
	}


	this.stopped = false
	this._Data = layer_sequence_create(layer, x, y, sequence)
	this._RawData = layer_sequence_get_sequence(_Data)
	//this.id = layer_sequence_get_instance(this._Data)

	this.speed = 1
	this.direction = layer_sequence_get_headdir(_Data)

 
	static set_coordinate = function(x, y) {
		layer_sequence_x(_Data, x)
		layer_sequence_y(_Data, y)

		x = x
		y = y
	}


	static set_x = function(value) {
		layer_sequence_x(_Data, value)

		x = value
	}


	static set_y = function(value) {
		layer_sequence_y(_Data, value)

		y = value
	}


	static set_loop = function(mode) {
		_RawData.loopmode = mode
	}


	static set_orientation = function(angle) {
		layer_sequence_angle(_Data, angle)
	}


	static set_xscale = function(scale) {
		layer_sequence_xscale(_Data, scale)
	}


	static set_yscale = function(scale) {
		layer_sequence_yscale(_Data, scale)
	}


	static set_speed = function(value) {
		speed = value
		layer_sequence_speedscale(_Data, value)
	}


	static seek = function(frame) {
		layer_sequence_headpos(_Data, frame)
	}


	static play = function() {
		if stopped {
			if direction == seqdir_left
				layer_sequence_headpos(_Data, layer_sequence_get_length(_Data))
			elif direction == seqdir_right
				layer_sequence_headpos(_Data, 0)

			stopped = false
		}
		layer_sequence_play(_Data)
	}


	static pause = function() {
		layer_sequence_pause(_Data)
	}


	static stop = function() {
		layer_sequence_pause(_Data)
		stopped = true
	}


	static restart = function() {
		stop()
		play()
	}


	static rewind = function() {
		stopped = false
		direction *= -1
		layer_sequence_headdir(_Data, direction)
		play()
	}


	static destroy = function() {
		layer_sequence_destroy(_Data)
	}


	static get_length = function() {
		return layer_sequence_get_length(_Data)
	}


	static is_finished = function() {
		return layer_sequence_is_finished(_Data)
	}


	static is_paused = function() {
		return layer_sequence_is_paused(_Data)
	}


	static is_playing = function() {
		return !layer_sequence_is_finished(_Data) and !layer_sequence_is_paused(_Data)
	}
}
