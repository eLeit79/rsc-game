var xMove = 0;
var yMove = 0;

if (keyboard_check(ord("A"))) {
	xMove--;
}
if (keyboard_check(ord("D"))) {
	xMove++;
}
if (keyboard_check(ord("W"))) {
	yMove--;
}
if (keyboard_check(ord("S"))) {
	yMove++;
}

if (mouse_x > x) {
	image_xscale = 1
}
if (mouse_x < x) {
	image_xscale = -1;
}

var moveSpeed = baseSpeed;
if (xMove != 0 && yMove != 0) {
	moveSpeed = baseSpeed * 0.71;
}

if (xMove == 0 && yMove == 0) {
	sprite_index = sprPlayer;
} else {
	sprite_index = sprPlayerRun;
}

xSpd = xMove * moveSpeed;
ySpd = yMove * moveSpeed;

xSpd += xKnock;
ySpd += yKnock;

xKnock *= 0.9;
yKnock *= 0.9;

tmCollision = layer_tilemap_get_id("CollisionLayer");

topMargin = 0;

x += xSpd;
bboxTop = bbox_top + topMargin;
if (xSpd < 0) {
	if (TileCollision(tmCollision, bbox_left, bboxTop, bbox_left, bbox_bottom)) {
		x = ((bbox_left + TILE_SIZE) & ~(TILE_SIZE - 1)) - (sprite_get_bbox_left(sprPlayer) - sprite_get_xoffset(sprPlayer));
		xSpd = 0;
		xKnock = 0;
	}
}
if (xSpd > 0) {
	if (TileCollision(tmCollision, bbox_right, bboxTop, bbox_right, bbox_bottom)) {
		x = (bbox_right & ~(TILE_SIZE - 1)) - 1 - (sprite_get_bbox_right(sprPlayer) - sprite_get_xoffset(sprPlayer));
		xSpd = 0;
		xKnock = 0;
	}
}

y += ySpd;
bboxTop = bbox_top + topMargin;
if (ySpd < 0) {
	if (TileCollision(tmCollision, bbox_left, bboxTop, bbox_right, bboxTop)) {
		y = ((bboxTop + TILE_SIZE) & ~(TILE_SIZE - 1)) - ((sprite_get_bbox_top(sprPlayer) + topMargin) - sprite_get_yoffset(sprPlayer));
		ySpd = 0;
		yKnock = 0;
	}
}
if (ySpd > 0) {
	if (TileCollision(tmCollision, bbox_left, bbox_bottom, bbox_right, bbox_bottom)) {
		y = (bbox_bottom & ~(TILE_SIZE - 1)) - 1 - (sprite_get_bbox_bottom(sprPlayer) - sprite_get_yoffset(sprPlayer));
		ySpd = 0;
		yKnock = 0;
	}
}
