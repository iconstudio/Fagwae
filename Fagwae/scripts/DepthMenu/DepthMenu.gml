/// @function DepthMenu
function DepthMenu(content, content_kind, predicate, width, height) constructor {
	this.content = content
	this.predicate = predicate
	this.width = width
	this.height = height


	this.deriven_state = null
	this.parent = null
	this.next = null
	this.before = null
	this.is_first = false
	this.is_last = false


	/// draw(x, y) -> next(x, y)
	this.draw = null
	this.draw_chosen = null


	static set_layer = function(target_state) {
		deriven_state = target_state
	}


	static attach_to = function(target_state) {
		if is_null(target_state) {
			if is_null(parent) { // do nothing
			} else {
				target_state.dettach(self)
			}
		} else {
			if !is_null(parent) {
				parent.dettach(self)
			}
			target_state.attach(self)
		}
	}
}


/// @function DepthMenuText
function DepthMenuText(caption): DepthMenu(caption, MENU_ITEM_TYPES.TEXT, null, 0, MENU_TEXT_HEIGHT) constructor {
	draw = function(x, y) {
		draw_text(x, y, content)
		return [0, height]
	}
}
