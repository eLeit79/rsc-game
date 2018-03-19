if (invincible <= 0 && other.state != enemyState.KNOCKED_OUT && other.state != enemyState.CAUGHT) {
	ShakeCamera(5);
	invincible = 60;
	hp--;
	audio_play_sound(sndHurt, 99, false);
	xKnock = lengthdir_x(8, point_direction(other.x, other.y, x, y));
	yKnock = lengthdir_y(8, point_direction(other.x, other.y, x, y));

	if (hp > 0 && roboCanSpeak) {
		var speakChance = irandom(100);
		if (speakChance < 25) {
			roboCanSpeak = false;
			alarm[0] = 3 * room_speed;
			audio_play_sound(sndRoboOuch, 101, false);
		}
	}
	
	if (hp <= 0) {
		ShakeCamera(50);
		instance_create_depth(x, y, bbox_bottom, objExplosion);
		xSpd = 0;
		ySpd = 0;
		objWeapon.visible = false;
		sprite_index = sprPlayerExplode;
		state = playerState.DYING
	}
}

if (other.state == enemyState.KNOCKED_OUT && state != playerState.DYING && state != playerState.DEAD && state != playerState.DEAD_FADEOUT) {
	audio_play_sound(sndCatch, 100, false);
	var inst = instance_create_depth(x, bbox_bottom, bbox_bottom, objPickupParticles);
	inst.pickupSprite = sprAlienGoo;
	if (roboCanSpeak) {
		var speakChance = irandom(100);
		if (speakChance < 25) {
			roboCanSpeak = false;
			alarm[0] = 3 * room_speed;
			audio_play_sound(sndRoboAliveComingWithMe, 101, false);
		}
	}
	other.state = enemyState.CAUGHT;
}
