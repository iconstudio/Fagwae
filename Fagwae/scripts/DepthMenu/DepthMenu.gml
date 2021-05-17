/// @function DepthMenuState
function DepthMenuState(menu) constructor {
	this.parent = menu


	this.mode = MENU_STATUSES.NORMAL
	this.fade_time = 0
	this.fade_period = 0.1


	this.selection = null


	static draw = function(x, y) {
		
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


	/// draw(x, y, index) ->next (x, y)
	this.draw = null
	this.draw_chosen = null


	static make_openable = function() {
		deriven_state = new DepthMenuState(self)
	}


	static attach = function(target_state) {
		parent = target_state
	}
}


/// @function DepthMenuText
function DepthMenuText(caption): DepthMenu(caption, MENU_ITEM_TYPES.TEXT, null, 0, MENU_TEXT_HEIGHT) constructor {
}
