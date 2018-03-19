/// @func SpawnPickup(xPos, yPos, destroyer, pickup)
/// @param xPos Y Position
/// @param yPos X Position
/// @param destroyer Destroyer object index
/// @param pickup Pickup object index
var xPos = argument0;
var yPos = argument1;
var destroyer = argument2;
var pickup = argument3;

var inst = instance_create_depth(xPos, yPos, yPos, pickup);
var spd = random_range(1.5, 3.0);
var dir = point_direction(destroyer.x, destroyer.y, xPos, yPos);
inst.xSpd = lengthdir_x(spd, dir);
inst.ySpd = lengthdir_y(spd, dir);
