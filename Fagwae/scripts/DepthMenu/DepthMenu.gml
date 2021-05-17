/// @function DepthMenuState
function DepthMenuState(menu) constructor {
	this.parent = menu


	this.mode = MENU_STATUSES.NORMAL
	this.fade_time = 0
	this.fade_period = 0.1


	this.child_first = null
	this.child_last = null
	this.selection = null


	static attach = function(item) {
		item.parent = self


		if is_null(child_first) {
			child_first = item
			child_last = item
			item.before = item
		} else {
			child_last.next = item
			item.before = child_last

			child_last = item
		}
	}


	static dettach = function(item) {
		if item.parent == self {
			item.parent = null


			var Before = item.before, Next = item.next
			if item == child_first {
				if !is_null(Next)
					child_first = Next
				else
					child_first = null
			}
			if item == child_last {
				if !is_null(Before)
					child_last = Before
				else
					child_last = null
			}


			if !is_null(Before)
				Before.next = Next
			if !is_null(Next)
				Next.before = Before
		}
	}


	static draw = function(x, y) {
		var child, draw_pos
		for (child = child_first; !is_null(child); child = child.next) {
			draw_pos = child.draw(x, y)
			x += draw_pos[0]
			y += draw_pos[1]
		}
	}
}


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


	static make_openable = function() {
		deriven_state = new DepthMenuState(self)
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
}
