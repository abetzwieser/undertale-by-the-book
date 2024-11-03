function Textbox() constructor {
	text_to_load = [""];
	empty = true;
	
	function store_text(t){
		show_debug_message("store text")
		if (self.empty) {
			self.text_to_load[0] = t;
			self.empty = false;
		}
		else {
			array_push(self.text_to_load, t);
		}
	}

	function make_textbox(){
		with (instance_create_depth(0, 0, -999, obj_textbox)){
			for (var i = 0; i < (array_length(other.text_to_load)); i++){
				add_text(other.text_to_load[i]);
			}
		}
	}
}

