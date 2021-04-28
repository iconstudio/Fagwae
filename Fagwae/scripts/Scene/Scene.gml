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

 
	function set_coordinate(x, y) {
		layer_sequence_x(_Data, x)
		layer_sequence_y(_Data, y)

		x = x
		y = y
	}


	function set_x(value) {
		layer_sequence_x(_Data, value)

		x = value
	}


	function set_y(value) {
		layer_sequence_y(_Data, value)

		y = value
	}


	function set_loop(mode) {
		_RawData.loopmode = mode
	}


	function set_orientation(angle) {
		layer_sequence_angle(_Data, angle)
	}


	function set_xscale(scale) {
		layer_sequence_xscale(_Data, scale)
	}


	function set_yscale(scale) {
		layer_sequence_yscale(_Data, scale)
	}


	function set_speed(value) {
		speed = value
		layer_sequence_speedscale(_Data, value)
	}


	function seek(frame) {
		layer_sequence_headpos(_Data, frame)
	}


	function play() {
		if stopped {
			if direction == seqdir_left
				layer_sequence_headpos(_Data, layer_sequence_get_length(_Data))
			elif direction == seqdir_right
				layer_sequence_headpos(_Data, 0)

			stopped = false
		}
		layer_sequence_play(_Data)
	}


	function pause() {
		layer_sequence_pause(_Data)
	}


	function stop() {
		layer_sequence_pause(_Data)
		stopped = true
	}


	function restart() {
		stop()
		play()
	}


	function rewind() {
		stopped = false
		direction *= -1
		layer_sequence_headdir(_Data, direction)
		play()
	}


	function destroy() {
		layer_sequence_destroy(_Data)
	}


	function get_length() {
		return layer_sequence_get_length(_Data)
	}


	function is_finished() {
		return layer_sequence_is_finished(_Data)
	}


	function is_paused() {
		return layer_sequence_is_paused(_Data)
	}


	function is_playing() {
		return !layer_sequence_is_finished(_Data) and !layer_sequence_is_paused(_Data)
	}
}
