if (rockets < maxRockets) {
	audio_play_sound(sndHealthPickup, 99, false);
	var inst = instance_create_depth(x, bbox_bottom, bbox_bottom, objPickupParticles);
	inst.pickupSprite = sprRocketParticle;
	rockets++;
	instance_destroy(other);
}
