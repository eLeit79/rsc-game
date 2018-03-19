if (numParts > 0) {
	var dir = random(360);
	var dist = random(size);
	var xx = x + lengthdir_x(dist, dir);
	var yy = y + lengthdir_y(dist, dir);
	var inst = instance_create_depth(xx, yy, yy, objExplosionPart);
	numParts--;
} else {
	instance_destroy();
}
