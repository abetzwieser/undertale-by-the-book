/// @description Initialize player & player actions

stats = global.player_stats;

//movement inputs
r_key = false;
l_key = false;
u_key = false;
d_key = false;

//interact inputs
//for some reason deltarune uses x to run fast so we're just gonna map "go fast" stuff to cancel
interact_key = false;
run_key = false;
active_item_key = false;

//movement
enum PLAYER_DIR {
	RIGHT = 0,
	UP = 1,
	LEFT = 2,
	DOWN = 3
}

player_dirs = [
	PLAYER_DIR.RIGHT,
	PLAYER_DIR.UP,
	PLAYER_DIR.LEFT,
	PLAYER_DIR.DOWN
];

spr_walk = [
    spr_player_rwalk,
	spr_player_uwalk,
	spr_player_lwalk,
    spr_player_dwalk
];

spr_run = [
];

spr = spr_walk;

adjust_x = 0;
adjust_y = 0;

vector = 0;
player_dir = PLAYER_DIR.DOWN;

can_move = true;
move_spd = 2;
