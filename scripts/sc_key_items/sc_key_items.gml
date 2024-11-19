function Key_Item() : Item() constructor {
	name = ""
	description = [""]
	hold_text = [""]
	
	function hold() {
		global.active_item = self
		display_hold_text()
	}
	
	function display_hold_text() {
		with (new Textbox()) {
			for (i = 0; i < array_length(other.hold_text); i++) {
				store_text(other.hold_text[i])
			}
			make_textbox()
		}
	}
}


function Torn_Notebook() : Key_Item() constructor {
	name = "Torn Notebook"
	description = ["A torn notebook. Here lie your deepest, darkest thoughts and secrets. Make sure to not leave it lying around, alright?"]
	hold_text = [""]
	
	function use() {
		show_debug_message("You used the notebook! Not that this does anything, yet.")
	}
}

function Rope() : Key_Item() constructor {
	name = "Rope"
	description = ["A sturdy hemp rope reinforced with magic.", 
		"If you see a ledge with a place to hook your rope onto, you've got a way to get up there!",
		"If only you had thought about magic reinforcements earlier..."]
	hold_text = ["((You're now carrying the Rope. Press Space when a ledge is nearby to attempt to climb it.))"]
	
	function use() {
		show_debug_message("You used key item 2! Not that this does anything, yet.")
	}
	
}

function Rusty_Key() : Key_Item() constructor {
	name = "Rusty Key"
	description = ["A key made of iron and copper. The iron is rusty and the copper is tarnished.",
		"A busted key, for a busted lock? That sounds like bad design."]
	hold_text = ["((You're now carrying the Rusty Key. Press Space when you think you've found a rusty lock.))"]
	
	function use() {
		show_debug_message("You used key item 3! Not that this does anything, yet.")
	}
	
}

function Research_Folder() : Key_Item() constructor {
	name = "Research Folder"
	description = [""]
	hold_text = [""]
	
	function use() {
		show_debug_message("You used key item 4! Not that this does anything, yet.")
	}
	
}

function Hagstone() : Key_Item() constructor {
	name = "Hagstone"
	description = [""]
	hold_text = [""]
	
	function use() {
		show_debug_message("You used key item 5! Not that this does anything, yet.")
	}
	
}

function Spray_Paint() : Key_Item() constructor {
	name = "Spray Paint"
	description = [""]
	hold_text = [""]
	
	function use() {
		show_debug_message("You used key item 6! Not that this does anything, yet.")
	}
	
}

function Matchbook() : Key_Item() constructor {
	name = "Matchbook"
	description = [""]
	hold_text = [""]
	
	function use() {
	}
}

// shawnter
// rope
// rusty key

// 2nd area - ask kody :)

// stephala
// research folder
// hagstone

// 4th - ask kody

// spray paint
// matchbook

// 6th has NONE

