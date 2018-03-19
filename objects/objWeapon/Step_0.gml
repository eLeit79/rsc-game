xWeaponOffset = sign(objPlayer.image_xscale) * -6;
x = objPlayer.x + xWeaponOffset;
y = objPlayer.y + yWeaponOffset;
shotFired = false;


if (weapon != global.weapons[NO_WEAPON]) {
	direction = point_direction(x, y, mouse_x, mouse_y);

	image_angle = direction;
	if (direction > 90.0 && direction < 270) {
		image_yscale = -1
	} else {
		image_yscale = 1;
	}
	recoil *= 0.9;
	if (rofCooldown > 0) rofCooldown--;
	
	if ((weapon[? "automatic"] && mouse_check_button(mb_left) && rofCooldown <= 0 &&
			objPlayer.state != playerState.DYING && objPlayer.state != playerState.DEAD &&
			objPlayer.state != playerState.DEAD_FADEOUT) ||
			(!weapon[? "automatic"] && mouse_check_button_pressed(mb_left))) {
		if (objPlayer.roboCanSpeak) {
			var speakChance = irandom(100);
			if (speakChance < 3) {
				objPlayer.roboCanSpeak = false;
				objPlayer.alarm[0] = 3 * room_speed;
				audio_play_sound(sndRoboGetSome, 101, false);
			}
		}
		shotFired = true;
		rofCooldown = weapon[? "rateOfFire"];
		recoil = weapon[? "recoil"];

		// SOUND
		audio_sound_pitch(sndGun, random_range(0.9, 1.2));
		audio_play_sound(sndGun, 100, false);
	
		// SPREAD
		var spread = weapon[? "spread"];
		var dir = direction + random_range(-spread, spread);
		var dx = lengthdir_x(1, dir);
		var dy = lengthdir_y(1, dir);
	
		// PROJECTILE
		var gunLength = weapon[? "length"];
		//var inst = instance_create_layer(x + dx * gunLength, y + dy * gunLength, "Instances", weapon[? "projectile"]);
		var inst = instance_create_depth(x + dx * gunLength, y + dy * gunLength, bbox_bottom, weapon[? "projectile"]);
		inst.direction = dir;
		inst.image_angle = dir;
		inst.speed = weapon[? "bulletSpeed"];
		inst.damage = weapon[? "damage"];
	
		// RECOIL
		//objPlayer.xKnock = -dx * 0.25;
		//objPlayer.yKnock = -dy * 0.25;
		objCamera.xGunShake = -dx * 2.5;
		objCamera.yGunShake = -dy * 2.5;
		//ShakeCamera(3);
	}
	
	if (mouse_check_button_pressed(mb_right) && objPlayer.rockets > 0) {
		audio_play_sound(sndRocketLaunch, 99, false);
		objPlayer.rockets--;
		var gunLength = weapon[? "length"];
		var dx = lengthdir_x(1, direction);
		var dy = lengthdir_y(1, direction);
		var inst = instance_create_depth(x + dx * gunLength, y + dy * gunLength, bbox_bottom, objRocket);
		inst.direction = direction;
		inst.image_angle = direction;
	}
}
depth = objPlayer.depth - 1;