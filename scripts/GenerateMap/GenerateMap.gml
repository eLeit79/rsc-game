/// @func GenerateMap(mapWidth, mapHeigh)

var mapWidth = argument0;
var mapHeight = argument1;
var mapGrid = ds_grid_create(mapWidth, mapHeight);
ds_grid_clear(mapGrid, 1);

var xStart = floor(mapWidth / 2);
var yStart = floor(mapHeight / 2);
var xPos = xStart;
var yPos = yStart;
DigSquare(mapGrid, xPos, yPos, 1, 1);

var minSize = 1;
var maxSize = 5;

var dirList = ds_list_create();
ds_list_add(dirList, DIR_UP);
ds_list_add(dirList, DIR_DOWN);
ds_list_add(dirList, DIR_LEFT);
ds_list_add(dirList, DIR_RIGHT);

var numDiggers = irandom_range(2, 4);

while (numDiggers > 0) {
	var dirId = irandom(ds_list_size(dirList));
	var digDir = dirList[| dirId];
	ds_list_delete(dirList, dirId);
	Digger(mapGrid, xStart, yStart, digDir, minSize, maxSize);
	numDiggers--;
}

return mapGrid;
