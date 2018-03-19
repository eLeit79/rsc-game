if (numParticles > 0) {
	var dir = random(360);
	var dist = random(16);
	var xx = objPlayer.x + lengthdir_x(dist, dir);
	var yy = objPlayer.y + lengthdir_y(dist * 0.75, dir);
	var part = instance_create_depth(xx, yy, objPlayer.bbox_bottom, objParticle);
	part.sprite_index = pickupSprite;
	part.ySpd = random_range(-1, -3);
	numParticles--;
} else {
	instance_destroy();
}
