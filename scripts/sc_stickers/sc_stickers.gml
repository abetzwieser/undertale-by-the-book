function Colony_Sticker() : Item() constructor {
	name = "Colony Sticker"
	description = ["A sticker depicting a spiral of army ants. Grants +1 ATK.",
		"Fun Fact: Ants have two stomachs!"]
	use_text = ["You apply the Colony Sticker to your Notebook. It has a hypnotic pattern."]
	
	function use() {
		display_use_text()
	}
}

function Magnolia_Sticker() : Item() constructor {
	name = "Magnolia Sticker"
	description = ["A sticker depicting falling magnolia petals. Grants +2 ATK.", 
		"Fun Fact: Magnolias are the oldest known flowering plants still around!"]
	use_text = ["You apply the Magnolia Sticker to your Notebook. It smells faintly sweet."]
	
	function use() {
		display_use_text()
	}
}

function Steampunk_Sticker() : Item() constructor {
	name = "Steampunk Sticker"
	description = [""]
	use_text = [""]
}

function Minimalist_Sticker() : Item() constructor {
	name = "Minimalist Sticker"
	description = [""]
	use_text = [""]
}