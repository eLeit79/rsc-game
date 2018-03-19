if (other.state != enemyState.KNOCKED_OUT and other.state != enemyState.CAUGHT) {
	var inst = instance_create_depth(x, y, bbox_bottom, objExplosion);
	instance_destroy();
}
