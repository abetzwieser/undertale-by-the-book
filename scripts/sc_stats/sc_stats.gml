function Stats() constructor{
	static level = 1;
	static base_atk = 2;
	static base_def = 0;
	static base_hp = 20;
	static hp = 20;
	
	static bonus_def = 0;
	static bonus_atk = 0;
	
	static xp = 0;
	static inv = 0;
	static spd = 0;
	
	function restore_hp(num){
		self.hp += num
		if self.hp > self.base_hp { self.hp = self.base_hp } 
	}
	
	function get_atk_pts(){
		return self.base_atk + self.bonus_atk;
	}
	
	function get_def_pts(){
		return self.base_def + self.bonus_def;
	}
	
	function get_battle_spd(){
		return 1 + self.spd*.10;
	}
	
	function get_iframes(){
		return self.inv*5;
	}
	
	function scale_xp(level){
		xp = power(level, 2);
		return xp
	}
	
	///stats level up functions aka setters
	function add_xp(xp) {
		self.xp += xp
		if self.xp >= scale_xp(level){
			self.xp = 0
			level_up(self.level, 1)
		}
	}
	
	function update_bonus_atk(num){
		self.bonus_atk += num;
	}
	
	function update_bonus_def(num){
		self.bonus_def += num;
	}
	
	function update_base_atk(level){
		self.base_atk = 2*level;
	}
	
	function update_base_hp(level) {
		var hp = 99;
		if (level != 20) {
			hp = 16 + 4*level;
		}
		self.base_hp = hp;
	}
	
	function update_base_def(level) {
		var def = 0;
		if (level == 20) {
			def = 5;
		}
		else if (level > 13) {
			def = 4;
		}
		else if (level > 8) {
			def = 3;
		}
		else if (level > 4) {
			def = 2;
		}
		else if (level > 1) {
			def = 1;
		}
		self.base_def = def;
	}
	
	function level_up(level, times=1){ // in case of multiple level up
		self.level += times;
		
		update_base_atk(level);
		update_base_def(level);
		update_base_hp(level);
		self.hp = self.base_hp
	}
}

// first instance of player / adding to party -> init_stats
function init_stats(){
	stats = new Stats();
	return stats;
}