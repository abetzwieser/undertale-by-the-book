// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function sc_items(){

}

// name
// use
// item
// arrays are pass by reference
//a.MyCleanUpFunction();
//delete a;
//a = undefined;

function Item() constructor {
	name = ""
	description = ""
	use_text = ""
	
	function use() {
	}
	
	function info() {
		with (new Textbox()){
			store_text(other.description)
			make_textbox()
		}
	}
	
	function display_use_text() {
		with (new Textbox()){
			store_text(other.use_text)
			make_textbox()
		}
	}
}


function Bauble() : Item() constructor {
	name = "bauble" 
	static uses = 0
	description = "A bauble. It seems to soothe your mind."
	
	function use() {
		// stats.update_bonus_def(1)
		if uses = 0 {
			show_debug_message("use ba")
			uses +=1
		}
	}
}

function Sticker() : Item() constructor {
	name = "sticker"
	description = "A sticker. Wow, it's like you did great on some homework!"
	
	function use() {
		stats.update_bonus_atk(1)
	}
}

function Honeydew_Tea() : Item() constructor {
	name = "\"Honeydew\" Tea"
	static uses = 0
	description = "\"Bubble\" tea made of \"honeydew\" melons. Heals 10 hp."
	use_text = ""
	
	function use() {
		uses += 1
		if uses == 1 {
			use_text = "You take a sip of Honeydew Tea. Fun Fact: Melons are related to cucumber plants!"
		}
		else if uses == 2 {
			use_text = "You take a sip of Honeydew Tea. Tastes like cucumber?"
		}
		else if uses == 3 {
			use_text = "You take a sip of \"Honeydew Tea.\" Tastes like betrayal. "
		}
		else {
			use_text = "You take a sip of \"Honeydew Tea.\" The identity fraud leaves a bad taste in your mouth."
		}
		
		display_use_text()
		// stats.restore_hp(10)
	}
}

function Magnolia_Tea() : Item() constructor {
	name = "Magnolia Tea"
	description = "A sweet tea made of magnolia flowers. You're tempted to fish out the petals with your tongue. Heals 12 HP."
	static uses = 0
	use_text = ""
	
	function use() {
		uses += 1
		if uses == 1 {
			use_text = "You take a sip of Magnolia Tea. Fun Fact: Magnolia flowers are pollinated by beetles instead of bees!"
		}
		else {
			use_text = "You take a sip of Magnolia Tea. As your beetle brethren intended."
		}
		
		display_use_text()
	}
}

function Twice_Dried_Fruits() : Item() constructor {
	name = "Twice Dried Fruits"
	description = "Someone decided to dry their dried fruits. NOT a good source of hydration. Heals 15 HP."
	static uses = 0
	use_text = ""
	
	function use() {
		uses +=1
		if uses == 1 {
			use_text = "You scarf down a handful of Twice Dried Fruits. Fun Fact: Cranberries bounce when ripe!"
		}
		else {
			use_text = "You scarf down a handful of Twice Dried Fruits. You’ve heard of twice baked cookies, but this is a little absurd."
		}
		
		display_use_text()
	}
}


function Chocolate_Crickets() : Item() constructor {
	name = "Chocolate Crickets"
	description = "Disgusting bugs disguised in an alluring chocolate coat. Heals 18 HP."
	static uses = 0
	use_text = ""
	
	function use() {
		uses += 1
		if uses == 1 {
			use_text = "You force down the Chocolate Crickets. Fun Fact: Crickets chirp by rubbing their wings together!"
		}
		else if uses == 2 {
			use_text = "You force down the Chocolate Crickets. Eating the bugs is just as gross as the first time."
		}
		else if uses == 3 {
			use_text = "You force down the Chocolate Crickets. The taste is beginning to grow on you…"
		}
		else {
			use_text = "You force down the Chocolate Crickets. You’re ashamed to admit you like eating bugs."
		}
		
		display_use_text()
	}
}

function Salted_Snails() : Item() constructor {
	name = "Salted Snails"
	description = "Don’t eat the shells. Heals 10, gives extra INV for 2 rounds."
	use_text = ""
	static uses = 0
	
	function use () {
		uses += 1
		if uses == 1 {
			use_text = "You slurp out the Salted Snails from their shells. Fun Fact: The study of snails is called malacology!"
		}
		else {
			use_text = "You slurp out the Salted Snails from their shells. And then drop the empty shells on the floor like a heathen. At least they’re  biodegradable…"
		}
		
		display_use_text()
	}
}

function Rose_Cake() : Item() constructor {
	name = "Rose Cake"
	description = "A chocolate cake with candied rose petals in the frosting. Looks like your birthday came early this year! Heals ALL HP."
	use_text = ""
	static uses = 0
	
	function use() {
		uses += 1
		if uses == 1 {
			use_text = "You savor the Rose Cake. Fun Fact: Roses have prickles, not thorns! You don’t remember what makes those different. "
		}
		else {
			use_text = "You savor the Rose Cake. It's sweet in a way that you can’t help but smile about."
			// if killed Shawnter
			// use_text = "You savor the Rose Cake. It's bittersweet..."
		}
		
		display_use_text()
	}
}

function Aquarium_Pebbles() : Item() constructor {
	name = "Aquarium Pebbles"
	description = "Little glass rocks that go at the bottom of a fish tank. They look a lot like candy, but aren't safe to eat."
	use_text = ""
	static uses = 0
	
	function use() {
		uses += 1
		if uses == 1 {
			use_text = "You crunch on the Aquarium Pebbles. Fun Fact: Glass can be formed by lightning striking the sand!"
		}
		else if uses == 2 {
			use_text = "You crunch on the Aquarium Pebbles. Forbidden snack."
		}
		else if uses == 3 {
			use_text = "Crunch. Snack."
		}
		else {
			use_text = "Crumch."
		}
		
		display_use_text()
	}
}

function Hot_Sauce() : Item() constructor {
	name = "Hot Sauce"
	description = "It’s not spicy, but the liquid inside is still boiling. Reduces HP by 6, but heals 3x as much over 3 rounds."
	use_text = ""
	static uses = 0
	
	function use() {
		uses +=1
		if uses == 1 {
			use_text = "You take a swig of the Hot Sauce before waiting for it to cool down. Fun Fact: Capsaicin has been used to make things spicy for thousands of years!"
		}
		else if uses == 2 {
			use_text = "You take a swig of the Hot Sauce before waiting for it to cool down. Why did you do that AGAIN???"
		}
		else if uses == 3 {
			use_text = "You take a swig of the Hot Sauce before waiting for it to cool down. This is getting out of hand."
		}
		else {
			use_text = "You take a swig of the Hot Sauce before waiting for it to cool down. One must imagine Sisyphus happy."
		}
		
		display_use_text()
	}
}

//stickers
// colony sticker
// info: a sticker depicting a spiral of army ants
// fun fact: ants have 2 stomachs
// use text: you apply the colony 

// magnolia sticker +2
// steampunk sticker
// prismatic sticker +2
// minimalist sticker

// name "Honeydew" Tea
// info "Bubble" tea made of "honeydew" melons. Restores 10 hp.
// use -> use text changes
// You take a sip of honeydew tea. Fun fact: melons

// name 
// info