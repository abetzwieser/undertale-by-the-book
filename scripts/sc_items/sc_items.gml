// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

// name
// use
// item
// arrays are pass by reference
//a.MyCleanUpFunction();
//delete a;
//a = undefined;

function init_use_count(ref) {
	global.use_counts.ref = 0;
}

function incr_use_count(ref) {
	global.use_counts.ref++;
}

function Item() constructor {
	name = "";
	description = [""];
	use_text = [[""]];
	
	hp = 0;
	init_use_count(name);
	
	function use() {
		return true;
	}
	
	function info() {
		with (new Textbox()){
			for (i = 0; i < array_length(other.description); i++) { store_text(other.description[i]) }
			make_textbox()
		}
	}
	
	function display_use_text(uses) {
		with (new Textbox()){
			if (uses >= array_length(other.use_text)) {uses = array_length(other.use_text) - 1}
			for (i = 0; i < array_length(other.use_text[uses]); i++) { store_text(other.use_text[uses][i]) }
			make_textbox()
		}
	}
	
	function heal() {
		if (global.player_stats.set_hp(hp)) {
			display_use_text(uses)
			return true;
		}
		else {
			return false;
		}
	}
}

function Honeydew_Tea() : Item() constructor {
	name = "\"Honeydew\" Tea"
	description = ["\"Bubble\" tea made of \"honeydew\" melons. Heals 10 hp."]
	use_text = [["You take a sip of Honeydew Tea. Fun Fact: Melons are related to cucumber plants!"],
		["You take a sip of Honeydew Tea. Tastes like cucumber?"],
		["You take a sip of \"Honeydew Tea.\" Tastes like betrayal."],
		["You take a sip of \"Honeydew Tea.\" The identity fraud leaves a bad taste in your mouth."]]
	
	hp = 10;
	static uses = 0
	
	function use() {
		if (heal()) {
			incr_use_count(name);
			return true;
		}
		else {
			return false;
		}
	}
}

function Magnolia_Tea() : Item() constructor {
	name = "Magnolia Tea"
	description = ["A sweet tea made of magnolia flowers. You're tempted to fish out the petals with your tongue. Heals 12 HP."]
	use_text = [["You take a sip of Magnolia Tea. Fun Fact: Magnolia flowers are pollinated by beetles instead of bees!"],
		["You take a sip of Magnolia Tea. As your beetle brethren intended."]]
	
	hp = 12;
	static uses = 0
	
	function use() {
		if (heal()) {
			incr_use_count(name);
			return true;
		}
		else {
			return false;
		}
	}
}

function Twice_Dried_Fruits() : Item() constructor {
	name = "Twice Dried Fruits"
	description = ["Someone decided to dry their dried fruits. NOT a good source of hydration. Heals 15 HP."]
	use_text = [["You scarf down a handful of Twice Dried Fruits. Fun Fact: Cranberries bounce when ripe!"],
		["You scarf down a handful of Twice Dried Fruits. You\'ve heard of twice baked cookies, but this is a little absurd."]]
	
	hp = 15;
	static uses = 0
	
	function use() {
		if (heal()) {
			incr_use_count(name);
			return true;
		}
		else {
			return false;
		}
	}
}


function Chocolate_Crickets() : Item() constructor {
	name = "Chocolate Crickets"
	description = ["Disgusting bugs disguised in an alluring chocolate coat. Heals 18 HP."]
	use_text = [["You force down the Chocolate Crickets. Fun Fact: Crickets chirp by rubbing their wings together!"],
		["You force down the Chocolate Crickets. Eating the bugs is just as gross as the first time."],
		["You force down the Chocolate Crickets. The taste is beginning to grow on you..."],
		["You force down the Chocolate Crickets. You’re ashamed to admit you like eating bugs."]]
	
	hp = 18;
	static uses = 0
	
	function use() {
		if (heal()) {
			incr_use_count(name);
			return true;
		}
		else {
			return false;
		}
	}
}

function Salted_Snails() : Item() constructor {
	name = "Salted Snails"
	description = ["Don’t eat the shells. Heals 10, gives extra INV for 2 rounds."]
	use_text = [["You slurp out the Salted Snails from their shells. Fun Fact: The study of snails is called malacology!"],
		["You slurp out the Salted Snails from their shells. And then drop the empty shells on the floor like a heathen. At least they’re biodegradable..."]]
	
	hp = 10;
	static uses = 0
	
	function use() {
		// change depending on whether in battle or not
		if (!global.battle_in_progress) {
			if (heal()) {
				incr_use_count(name);
				return true;
			}
			else {
				return false;
			}
		}
	}
}

function Rose_Cake() : Item() constructor {
	name = "Rose Cake"
	description = ["A chocolate cake with candied rose petals in the frosting. Looks like your birthday came early this year! Heals ALL HP."]
	use_text = [["You savor the Rose Cake. Fun Fact: Roses have prickles, not thorns! You don't remember what makes those different."],
		["You savor the Rose Cake. It's sweet in a way that you can’t help but smile about."]]
	
	hp = 99
	static uses = 0
	
	function use() {
		if (heal()) {
			incr_use_count(name);
			return true;
		}
		else {
			return false;
		}
	}
}

function Aquarium_Pebbles() : Item() constructor {
	name = "Aquarium Pebbles"
	description = ["Little glass rocks that go at the bottom of a fish tank. They look a lot like candy, but aren't safe to eat."]
	use_text = [["You crunch on the Aquarium Pebbles. Fun Fact: Glass can be formed by lightning striking the sand!"],
		["You crunch on the Aquarium Pebbles. Forbidden snack."],
		["Crunch. Snack."],
		["Crumch."]]
	
	static uses = 0
	
	function use() {
		display_use_text(uses)
		incr_use_count(name);
		return true;
	}
}

function Hot_Sauce() : Item() constructor {
	name = "Hot Sauce"
	description = ["It's not spicy, but the liquid inside is still boiling. Reduces HP by 6, but heals 3x as much over 3 rounds."]
	use_text = [["You take a swig of the Hot Sauce before waiting for it to cool down.",
					"Fun Fact: Capsaicin has been used to make things spicy for thousands of years!"],
				["You take a swig of the Hot Sauce before waiting for it to cool down. Why did you do that AGAIN???"],
				["You take a swig of the Hot Sauce before waiting for it to cool down. This is getting out of hand."],
				["You take a swig of the Hot Sauce before waiting for it to cool down. One must imagine Sisyphus happy."]]
	
	hp = -6
	static uses = 0
	
	function use() {
		if (heal()) {
			incr_use_count(name);
			return true;
		}
		else {
			return false;
		}
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