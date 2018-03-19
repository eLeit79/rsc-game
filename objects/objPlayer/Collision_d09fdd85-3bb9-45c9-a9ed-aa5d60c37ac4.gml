if (hp < maxHp) {
	audio_play_sound(sndHealthPickup, 99, false);
	instance_create_depth(x, bbox_bottom, bbox_bottom, objPickupParticles);
	hp++;
	instance_destroy(other);
}
