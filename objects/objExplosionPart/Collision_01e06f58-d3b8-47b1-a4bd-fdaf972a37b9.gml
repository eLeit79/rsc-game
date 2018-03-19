if (other.state != enemyState.KNOCKED_OUT) {
	repeat(irandom_range(10, 15)) {
		var inst = instance_create_depth(x, y, bbox_bottom, objAlienGoo);
		inst.direction = random(360);
		inst.speed = random_range(2.5, 5);
	}
	audio_play_sound(sndWallHit, 98, false);
	with (other) {
		hitFlash = 2;
		hp -= 1;
		if (hp <= 0) {
			xSpd = 0;
			ySpd = 0;
			knockoutTimer = knockoutTime * room_speed;
			state = enemyState.KNOCKED_OUT;
		}
	}
}
