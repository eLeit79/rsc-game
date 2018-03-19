repeat (5) {
	var rDir = random(360);
	var rDist = random(5);
	var rx = x + lengthdir_x(rDist, rDir);
	var ry = y + lengthdir_y(rDist, rDir);
	instance_create_depth(rx, ry, bbox_bottom, objRocketSmoke);
}

var tmCollision = layer_tilemap_get_id("CollisionLayer");
var xSpd = lengthdir_x(speed, direction);
var ySpd = lengthdir_y(speed, direction);

if (xSpd < 0.0) {
	if (TileCollision(tmCollision, bbox_left, bbox_top, bbox_left, bbox_bottom)) {
		instance_create_depth(x, y, bbox_bottom, objExplosion);
		instance_destroy();
	}
}
if (xSpd > 0.0) {
	if (TileCollision(tmCollision, bbox_right, bbox_top, bbox_right, bbox_bottom)) {
		instance_create_depth(x, y, bbox_bottom, objExplosion);
		instance_destroy();
	}
}
if (ySpd < 0.0) {
	if (TileCollision(tmCollision, bbox_left, bbox_top, bbox_right, bbox_top)) {
		instance_create_depth(x, y, bbox_bottom, objExplosion);
		instance_destroy();
	}
}
if (ySpd > 0.0) {
	if (TileCollision(tmCollision, bbox_left, bbox_bottom, bbox_right, bbox_bottom)) {
		instance_create_depth(x, y, bbox_bottom, objExplosion);
		instance_destroy();
	}
}

depth = -bbox_bottom + 2000;
