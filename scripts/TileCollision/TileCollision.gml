/// @func TileCollision(collisionLayer, x1, y1, x2, y2)
/// @desc Check for tile collision
/// @param {real} collisionLayer
/// @param {real} x1
/// @param {real} y1
/// @param {real} x2
/// @param {real} y2

var collisionLayer = argument0;
var x1 = argument1;
var y1 = argument2;
var x2 = argument3;
var y2 = argument4;
var result = false;

var t1 = tilemap_get_at_pixel(collisionLayer, x1, y1) & tile_index_mask;
var t2 = tilemap_get_at_pixel(collisionLayer, x2, y2) & tile_index_mask;
if (t1 != 0 || t2 != 0) {
	result = true;
}

return result;
