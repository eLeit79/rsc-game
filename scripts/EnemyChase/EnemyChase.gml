var playerDir = point_direction(x, y, objPlayer.x, objPlayer.y);
xSpd = lengthdir_x(moveSpeed, playerDir);
ySpd = lengthdir_y(moveSpeed, playerDir);
EnemyMove();

if (distance_to_object(objPlayer) >= chaseDistance || !objPlayer.visible) {
	state = enemyState.IDLE;
}
