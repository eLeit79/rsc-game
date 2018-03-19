/// @func GenerateLevel(mapWidth, mapHeight)
/// @desc Procedurally generates level
/// @arg {real} width Width in tiles
/// @arg {real} height Height in tiles

var mapWidth = argument0;
var mapHeight = argument1;

var mapGrid = GenerateMap(mapWidth, mapHeight);

return mapGrid;
