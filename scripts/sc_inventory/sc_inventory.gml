function Notebook() constructor {
	p1 = "Look! You're making a game! Isn't that cool?"
	pages = [p1]
	
	function get_pages(){
		return self.pages
	}
}

function Inventory() constructor{
	// for testing
	test_consumables = []
	array_push(test_consumables, new Magnolia_Tea())
	array_push(test_consumables, new Twice_Dried_Fruits())
	array_push(test_consumables, new Chocolate_Crickets())
	array_push(test_consumables, new Honeydew_Tea())
	array_push(test_consumables, new Salted_Snails())
	array_push(test_consumables, new Rose_Cake())
	array_push(test_consumables, new Aquarium_Pebbles())
	array_push(test_consumables, new Hot_Sauce())
	test_key_items = []
	array_push(test_key_items, new Torn_Notebook())
	array_push(test_key_items, new Matchbook())
	array_push(test_key_items, new Rope())
	array_push(test_key_items, new Research_Folder())
	array_push(test_key_items, new Spray_Paint())
	array_push(test_key_items, new Rusty_Key())
	array_push(test_key_items, new Hagstone())
	
	
	// arrays are pass by ref
	consumables = test_consumables
	key_items = test_key_items
	instance = noone;
	notebook = new Notebook()
	
	function add_consumable(item){
		if array_length(consumables) < 20 { array_push(self.consumables, item) }
		else {
			with (new Textbox()) {
				store_text("Your inventory is full!")
				make_textbox()
			}
		}
	}
	
	function add_key_item(item){
		array_push(self.key_items, item);
	}
	
	function display_inventory(){
		if (!global.inventory_displayed && !global.dialogue_in_progress) {
			global.inventory_displayed = true;
			with (instance_create_depth(0, 0, -998, obj_inventory)){
					init(other.consumables, other.key_items, other.notebook)
					other.instance = self;
			}
		}
	}
	
	function undisplay_inventory(){
		global.inventory_displayed = false;
		instance_destroy(instance);
	}
		
}





