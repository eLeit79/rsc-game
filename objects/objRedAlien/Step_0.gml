// Inherit the parent event
event_inherited();

if (state == enemyState.IDLE) {
	sprite_index = sprRedAlienIdle;
}
if (state == enemyState.WALK || state == enemyState.CHASE) {
	sprite_index = sprRedAlienWalk;
}
if (state == enemyState.KNOCKED_OUT) {
	sprite_index = sprRedAlienKO;
}
