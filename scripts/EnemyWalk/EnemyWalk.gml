
var collideWithWall = EnemyMove();

stateTime--;
if (stateTime <= 0 || collideWithWall) {
	state = enemyState.IDLE;
	stateTime = irandom_range(30, 90);
	xSpd = 0;
	ySpd = 0;
}
