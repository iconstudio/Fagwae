/// @function DepthMenuGroup
function DepthMenuGroup(menu_layer) {
	return instance_create(oMenuLayer, menu_layer)
}


/// @function DepthMenuPipeHorizontal
function DepthMenuPipeHorizontal() {
	draw_set.accumulate(0, draw_set.get_size(), x, function(dx, item) {
		if !is_null(item.draw) {
			item.draw(dx, y)
		}
		return x + item.width
	})
}


/// @function DepthMenuPipeVertical
function DepthMenuPipeVertical() {
	draw_set.accumulate(0, draw_set.get_size(), y, function(dy, item) {
		if !is_null(item.draw) {
			item.draw(x, dy)
		}
		return dy + item.height
	})
}


/// @function DepthMenuPipeBoth
function DepthMenuPipeBoth() {
	draw_set.accumulate(0, draw_set.get_size(), [x, y], function(dpos, item) {
		if !is_null(item.draw) {
			item.draw(dpos[0], dpos[1])
		}
		return [dpos[0] + item.width, dpos[1] + item.height]
	})
}


/// @function DepthMenu
function DepthMenu(content, predicate) constructor {
	this.parent = null
	this.order = 0


	this.content = content
	this.draw = null
	this.x = 0
	this.y = 0
	this.w = 0
	this.h = 0


	this.predicate = predicate
}


/// @function DepthMenuBlender
function DepthMenuBlender(alpha, color) constructor {
	this.image_alpha = alpha
	this.image_blend = color


	this.draw = function() {
		draw_set_alpha(image_alpha)
		draw_set_color(image_blend)
	}
}


/// @function DepthMenuColor
function DepthMenuColor(color) constructor {
	this.image_blend = color


	this.draw = function() {
		draw_set_color(image_blend)
	}
}


/// @function DepthMenuFont
function DepthMenuBlender(font) constructor {
	this.font = font


	this.draw = function() {
		draw_set_font(font)
	}
}


/// @function DepthMenuAlign
function DepthMenuAlign(halign, valign) constructor {
	this.halign = halign
	this.valign = valign


	this.draw = function() {
		draw_set_halign(halign)
		draw_set_valign(valign)
	}
}


/// @function DepthMenuText
function DepthMenuText(caption) {
	static draw = function() {
		draw_text(x, y, content)
	}


	var item = new DepthMenu(caption, null)
	item.draw = draw
	return item
}
