/// @func DestroyBox(box, destroyer)
/// @param box Box object index
/// @param destroyer Destroyer object index

var box = argument0;
var destroyer = argument1;

var explode = irandom(100);
if (explode < 5) {
	var explosion = instance_create_depth(other.x, other.y, other.bbox_bottom, objExplosion);
	explosion.size = 20;
} else {
	ShakeCamera(3);
	audio_play_sound_at(sndBoxHit, x, y, 0, 128, 1024, 1, false, 99);
}
var numParts = irandom_range(5, 6);
repeat(numParts) {
	var part = instance_create_depth(box.x, box.y, 3950, objBoxPart);
	var partIndex = irandom(2);
	switch (partIndex) {
		case 0:
			part.sprite_index = sprBoxPart1;
			break;
		case 1:
			part.sprite_index = sprBoxPart2;
			break;
		case 2:
			part.sprite_index = sprBoxPart3;
			break;
	}
	part.image_angle = random(360);
	part.direction = random(360);
	var spd = random_range(2.5, 5);
	part.xSpd = lengthdir_x(spd, part.direction);
	part.ySpd = lengthdir_y(spd, part.direction);
	part.rotSpeed = random_range(-15, 15);
}

var chance = irandom(99);
if (chance < 50) {
	var pickupType = irandom(99);
	if (pickupType >= 0 && pickupType < 55) {
		SpawnPickup(box.x, box.y, destroyer, objHealthPack);
	}
	if (pickupType >= 55 && pickupType < 100) {
		SpawnPickup(box.x, box.y, destroyer, objRocketPack);
	}
}

instance_destroy(box);
