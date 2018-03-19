with (other) {
	if (invincible <= 0) {
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
			xSpd = 0;
			ySpd = 0;
			objWeapon.visible = false;
			sprite_index = sprPlayerExplode;
			state = playerState.DYING
		}
	}
}
