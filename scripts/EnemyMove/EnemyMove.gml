var collideWithWall = false;

var tmCollision = layer_tilemap_get_id("CollisionLayer");
var topMargin = 0;
var bboxTop = bbox_top + topMargin;

x += xSpd;
if (xSpd < 0) {
	if (TileCollision(tmCollision, bbox_left, bboxTop, bbox_left, bbox_bottom)) {
		x = ((bbox_left + TILE_SIZE) & ~(TILE_SIZE - 1)) - (sprite_get_bbox_left(sprite_index) - sprite_get_xoffset(sprite_index));
		xSpd = 0;
		collideWithWall = true;
	}
}
if (xSpd > 0) {
	if (TileCollision(tmCollision, bbox_right, bboxTop, bbox_right, bbox_bottom)) {
		x = (bbox_right & ~(TILE_SIZE - 1)) - 1 - (sprite_get_bbox_right(sprite_index) - sprite_get_xoffset(sprite_index));
		xSpd = 0;
		collideWithWall = true;
	}
}

y += ySpd;
bboxTop = bbox_top + topMargin;
if (ySpd < 0) {
	if (TileCollision(tmCollision, bbox_left, bboxTop, bbox_right, bboxTop)) {
		y = ((bboxTop + TILE_SIZE) & ~(TILE_SIZE - 1)) - ((sprite_get_bbox_top(sprite_index) + topMargin) - sprite_get_yoffset(sprite_index));
		ySpd = 0;
		collideWithWall = true;
	}
}
if (ySpd > 0) {
	if (TileCollision(tmCollision, bbox_left, bbox_bottom, bbox_right, bbox_bottom)) {
		y = (bbox_bottom & ~(TILE_SIZE - 1)) - 1 - (sprite_get_bbox_bottom(sprite_index) - sprite_get_yoffset(sprite_index));
		ySpd = 0;
		collideWithWall = true;
	}
}

return collideWithWall;
