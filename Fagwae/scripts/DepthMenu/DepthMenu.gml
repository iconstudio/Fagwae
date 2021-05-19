/// @function DepthMenuGroup
function DepthMenuGroup(menu_layer) {
	return instance_create(oMenuGroup, menu_layer)
}


/// @function DepthMenuPipeHorizontal
function DepthMenuPipeHorizontal(ox, oy) {
	draw_transform_stack_push()
	draw_transform_set_translation(ox, oy, 0)
	draw_set.accumulate(0, draw_set.get_size(), 0, function(dx, item) {
		if !is_null(item.draw) {
			item.draw(dx, 0)
		}
		return dx + item.w
	})
	draw_transform_stack_pop()
}


/// @function DepthMenuPipeVertical
function DepthMenuPipeVertical(ox, oy) {
	draw_transform_stack_push()
	draw_transform_set_translation(ox, oy, 0)
	draw_set.accumulate(0, draw_set.get_size(), 0, function(dy, item) {
		if !is_null(item.draw) {
			item.draw(0, dy)
		}
		return dy + item.h
	})
	draw_transform_stack_pop()
}


/// @function DepthMenuPipeBoth
function DepthMenuPipeBoth(ox, oy) {
	draw_transform_stack_push()
	draw_transform_set_translation(ox, oy, 0)
	draw_set.accumulate(0, draw_set.get_size(), [0, 0], function(dpos, item) {
		if !is_null(item.draw) {
			item.draw(dpos[0], dpos[1])
		}
		return [dpos[0] + item.w, dpos[1] + item.h]
	})
	draw_transform_stack_pop()
}


/// @function DepthMenuPipeFree
function DepthMenuPipeFree(ox, oy) {
	draw_transform_stack_push()
	draw_transform_set_translation(ox, oy, 0)
	draw_set.foreach_all(function(item) {
		if !is_null(item.draw) {
			item.draw(0, 0)
		}
	})
	draw_transform_stack_pop()
}


/// @function DepthMenu
function DepthMenu(renderer, content, predicate) constructor {
	this.renderer = renderer
	this.parent = null
	this.order = 0


	this.content = content
	this.draw = null
	this.x = 0
	this.y = 0
	this.w = 0
	this.h = 0


	this.predicate = predicate


	static set_width = function(value) {
		this.w = value

		return self
	}


	static set_height = function(value) {
		this.h = value

		return self
	}


	static set_predicate = function(predicate) {
		this.predicate = predicate

		return self
	}


	static set_drawer = function(predicate) {
		this.draw = predicate

		return self
	}


	static attach = function(group) {
		if !is_null(group) {
			group.join(self)
		}

		return self
	}
}


/// @function DepthMenuDummy
function DepthMenuDummy() constructor {
	this.w = 0
	this.h = 0
	this.draw = null
}


/// @function DepthMenuBlender
function DepthMenuBlender(alpha, color): DepthMenuDummy() constructor {
	this.image_alpha = alpha
	this.image_blend = color


	static draw = function() {
		draw_set_alpha(image_alpha)
		draw_set_color(image_blend)
	}
}


/// @function DepthMenuColor
function DepthMenuColor(color): DepthMenuDummy() constructor {
	this.image_blend = color


	static draw = function() {
		draw_set_color(image_blend)
	}
}


/// @function DepthMenuFont
function DepthMenuFont(font): DepthMenuDummy() constructor {
	this.font = font


	static draw = function() {
		draw_set_font(font)
	}
}


/// @function DepthMenuAlign
function DepthMenuAlign(halign, valign): DepthMenuDummy() constructor {
	this.halign = halign
	this.valign = valign


	static draw = function() {
		draw_set_halign(halign)
		draw_set_valign(valign)
	}
}


/// @function DepthMenuText
function DepthMenuText(caption) {
	static draw = function(dx, dy) {
		draw_text(dx, dy, content)
	}


	var item = new DepthMenu(id, caption, null)
	item.set_drawer(draw)
	item.set_height(MENU_TEXT_HEIGHT)
	return item
}
