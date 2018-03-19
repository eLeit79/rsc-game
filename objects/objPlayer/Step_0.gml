/// @description Update

if (state != playerState.LEVEL_DONE && state != playerState.LEVEL_FADEOUT) {
	var eCount = instance_number(objEnemy);
	if (eCount == 0) {
		xSpd = 0;
		ySpd = 0;
		objWeapon.visible = false;
		image_index = 0;
		sprite_index = sprPlayerTeleport;
		state = playerState.LEVEL_DONE;
	}
}

if (invincible > 0 && state != playerState.DYING && state != playerState.DEAD) {
	invincible--;
	if (hitFlash <= -5) {
		hitFlash = 5;
	}
	hitFlash--;
} else {
	hitFlash = 0;
}

switch(state) {
	case playerState.NORMAL:
		PlayerNormal();
		break;
	case playerState.LEVEL_DONE:
		if (image_index > image_number - 1) {
			objStatus.transState = transitionState.FADE_OUT;
			state = playerState.LEVEL_FADEOUT;
		}		
		break;
	case playerState.LEVEL_FADEOUT:
		if (objStatus.transState = transitionState.IDLE) {
			if (room_next(room)) {
				room_goto_next();
			} else {
				room_goto(rmLevel01);
			}
		}
		break;
	case playerState.DYING:
		x += xKnock;
		y += yKnock;
		xKnock *= 0.9;
		yKnock *= 0.9;
		if (image_index > image_number - 1) {
			if (roboCanSpeak) {
				var speakChance = irandom(100);
				if (speakChance < 75) {
					roboCanSpeak = false;
					alarm[0] = 3 * room_speed;
					var voiceLine = irandom(1);
					switch (voiceLine) {
						case 0:
							audio_play_sound(sndRoboIllBeBack, 101, false);
							break;
						case 1:
							audio_play_sound(sndRoboRebooting, 101, false);
							break;
					}
				}
			}
			visible = false;
			state = playerState.DEAD;
			alarm[11] = 3 * room_speed;
		}
		break;
	case playerState.DEAD:
		break;
	case playerState.DEAD_FADEOUT:
		if (objStatus.transState = transitionState.IDLE) {
			room_restart();
		}
		break;
}

if (state != playerState.DYING) {
	depth = -bbox_bottom + 2000;
} else {
	depth = 0;
}

audio_listener_position(x, y, 0);
audio_listener_velocity(xSpd + xKnock, ySpd + yKnock, 0);
