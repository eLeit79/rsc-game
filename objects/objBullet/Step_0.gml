tmCollision = layer_tilemap_get_id("CollisionLayer");
var xSpd = lengthdir_x(speed, direction);
var ySpd = lengthdir_y(speed, direction);

if (xSpd < 0.0) {
	if (TileCollision(tmCollision, bbox_left, bbox_top, bbox_left, bbox_bottom)) {
		var inst = instance_create_layer(x, y, "Instances", objImpact);
		inst.image_angle = random(360);
		audio_play_sound_at(sndWallHit, x, y, 0, 128, 1024, 1, false, 98);
		instance_destroy();
	}
}
if (xSpd > 0.0) {
	if (TileCollision(tmCollision, bbox_right, bbox_top, bbox_right, bbox_bottom)) {
		var inst = instance_create_layer(x, y, "Instances", objImpact);
		inst.image_angle = random(360);
		audio_play_sound_at(sndWallHit, x, y, 0, 128, 1024, 1, false, 98);
		instance_destroy();
	}
}
if (ySpd < 0.0) {
	if (TileCollision(tmCollision, bbox_left, bbox_top, bbox_right, bbox_top)) {
		var inst = instance_create_layer(x, y, "Instances", objImpact);
		inst.image_angle = random(360);
		audio_play_sound_at(sndWallHit, x, y, 0, 128, 1024, 1, false, 98);
		instance_destroy();
	}
}
if (ySpd > 0.0) {
	if (TileCollision(tmCollision, bbox_left, bbox_bottom, bbox_right, bbox_bottom)) {
		var inst = instance_create_layer(x, y, "Instances", objImpact);
		inst.image_angle = random(360);
		audio_play_sound_at(sndWallHit, x, y, 0, 128, 1024, 1, false, 98);
		instance_destroy();
	}
}
