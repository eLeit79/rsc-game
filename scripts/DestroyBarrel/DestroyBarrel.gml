/// @func DestroyBarrel(barrel)
/// @param barrel Barrel object
var barrel = argument0;

instance_create_depth(barrel.x, barrel.y, barrel.bbox_bottom, objExplosion);
var numParts = irandom_range(5, 6);
repeat(numParts) {
	var part = instance_create_depth(barrel.x, barrel.y, 3950, objBarrelPart);
	part.image_speed = 0;
	part.image_index = irandom(3);
	part.image_angle = random(360);
	part.direction = random(360);
	var spd = random_range(2.5, 5);
	part.xSpd = lengthdir_x(spd, part.direction);
	part.ySpd = lengthdir_y(spd, part.direction);
	part.rotSpeed = random_range(-15, 15);
}

instance_destroy(barrel);
