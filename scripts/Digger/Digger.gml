/// @func Digger(mapGrid, xStart, yStart, digDir, minSize, maxSize)

var mapGrid = argument0;
var mapWidth = ds_grid_width(mapGrid);
var mapHeight = ds_grid_height(mapGrid);

var xStart = argument1;
var yStart = argument2;
var xPos = xStart;
var yPos = yStart;

var digDir = argument3;
var minSize = argument4;
var maxSize = argument5;

var notDir = DIR_NONE;
switch (digDir) {
	case DIR_UP:
		notDir = DIR_DOWN;
		break;
	case DIR_DOWN:
		notDir = DIR_UP;
		break;
	case DIR_LEFT:
		notDir = DIR_RIGHT;
		break;
	case DIR_RIGHT:
		notDir = DIR_LEFT;
		break;
}

var dir;
var prevDir = DIR_NONE;

var done = false;

while (!done) {
	do {
		dir = irandom(3);
	} until (dir != notDir && dir != prevDir);
	prevDir = dir;
	
	var width = irandom_range(1, maxSize);
	if (width < minSize) width = 1;
	var height = irandom_range(1, maxSize);
	if (height < minSize) height = 1;
	switch (dir) {
		case DIR_UP:
			yPos -= ceil(height / 2);
			break;
		case DIR_DOWN:
			yPos += ceil(height / 2);
			break;
		case DIR_LEFT:
			xPos -= ceil(width / 2);
			break;
		case DIR_RIGHT:
			xPos += ceil(width / 2);
			break;
	}
	DigSquare(mapGrid, xPos, yPos, width, height);
	if (dir == DIR_UP && yPos <= maxSize) done = true;
	if (dir == DIR_DOWN && yPos >= mapHeight - maxSize - 1) done = true; 
	if (dir == DIR_LEFT && xPos <= maxSize) done = true;
	if (dir == DIR_RIGHT && xPos >= mapWidth - maxSize - 1) done = true; 
}
