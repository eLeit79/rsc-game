/// @func DigSquare(mapGrid, sx, sy, sw, sh)
/// @arg {real} mapGrid Id of map grid
/// @arg {real} sx Square x position
/// @arg {real} sy Square y position
/// @arg {real} sw Square width
/// @arg {real} sh Square height

var mapGrid = argument0;
var sx = argument1;
var sy = argument2;
var sw = argument3;
var sh = argument4;

var swMin = floor(sw / 2);
var swMax = ceil(sw / 2);
var shMin = floor(sh / 2);
var shMax = ceil(sh / 2);

for (var my = sy - shMin; my < sy + shMax; my++) {
	for (var mx = sx - swMin; mx < sx + swMax; mx++) {
		mapGrid[# mx, my] = 0;
	}
}
