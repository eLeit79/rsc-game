if (state != enemyState.KNOCKED_OUT && state != enemyState.CAUGHT && objPlayer.visible) {
	if (distance_to_object(objPlayer) < chaseDistance) {
		state = enemyState.CHASE;
	}
}

switch (state) {
	case enemyState.IDLE:
		EnemyIdle();
		break;
	case enemyState.WALK:
		EnemyWalk();
		break;
	case enemyState.CHASE:
		EnemyChase();
		break;
	case enemyState.KNOCKED_OUT:
		knockoutTimer--;
		if (knockoutTimer <= 0) {
			hp = initialhp;
			state = enemyState.IDLE;
		}
		break;
	case enemyState.CAUGHT:
		image_alpha -= 0.1;
		if (image_alpha <= 0) {
			instance_destroy();
		}
		break;
}

if (xSpd < 0) {
	image_xscale = -1;
}
if (xSpd > 0) {
	image_xscale = 1;
}

depth = -bbox_bottom + 2000;

if (hp >= initialhp) hpAlpha -= 0.05;
if (hpAlpha > 1.0) hpAlpha = 1.0;
if (hp < initialhp) hpAlpha += 0.05;
if (hpAlpha < 0.0) hpAlpha = 0.0;
