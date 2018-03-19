/// @description Setup globals and enums

#macro TILE_SIZE 32
#macro GAME_HEIGHT 360

#macro DIR_NONE -1
#macro DIR_UP 0
#macro DIR_DOWN 1
#macro DIR_LEFT 2
#macro DIR_RIGHT 3

enum playerState {
	INIT,
	NORMAL,
	DYING,
	DEAD,
	DEAD_FADEOUT,
	LEVEL_DONE,
	LEVEL_FADEOUT
}

enum enemyState {
	IDLE,
	WALK,
	CHASE,
	KNOCKED_OUT,
	CAUGHT
}

enum transitionState {
	FADE_IN,
	IDLE,
	FADE_OUT
}

enum endState {
	FADE_IN,
	SHOW_ENDING,
	FADE_OUT,
	DONE
}

randomize();

InitWeapons();

room_goto_next();