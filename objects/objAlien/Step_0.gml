// Inherit the parent event
event_inherited();

if (state == enemyState.IDLE) {
	sprite_index = sprAlienIdle;
}
if (state == enemyState.WALK || state == enemyState.CHASE) {
	sprite_index = sprAlienWalk;
}
if (state == enemyState.KNOCKED_OUT) {
	sprite_index = sprAlienKO;
}
