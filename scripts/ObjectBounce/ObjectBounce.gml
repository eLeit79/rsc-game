var tmCollision = layer_tilemap_get_id("CollisionLayer");
x += xSpd;
if (xSpd < 0) {
	if (TileCollision(tmCollision, bbox_left, bbox_top, bbox_left, bbox_bottom)) {
		x = ((bbox_left + TILE_SIZE) & ~(TILE_SIZE - 1)) - (sprite_get_bbox_left(sprite_index) - sprite_get_xoffset(sprite_index));
		xSpd = -xSpd;
	}
}
if (xSpd > 0) {
	if (TileCollision(tmCollision, bbox_right, bbox_top, bbox_right, bbox_bottom)) {
		x = (bbox_right & ~(TILE_SIZE - 1)) - 1 - (sprite_get_bbox_right(sprite_index) - sprite_get_xoffset(sprite_index));
		xSpd = -xSpd;
	}
}

y += ySpd;
if (ySpd < 0) {
	if (TileCollision(tmCollision, bbox_left, bbox_top, bbox_right, bbox_top)) {
		y = ((bbox_top + TILE_SIZE) & ~(TILE_SIZE - 1)) - (sprite_get_bbox_top(sprite_index) - sprite_get_yoffset(sprite_index));
		ySpd = -ySpd;
	}
}
if (ySpd > 0) {
	if (TileCollision(tmCollision, bbox_left, bbox_bottom, bbox_right, bbox_bottom)) {
		y = (bbox_bottom & ~(TILE_SIZE - 1)) - 1 - (sprite_get_bbox_bottom(sprite_index) - sprite_get_yoffset(sprite_index));
		ySpd = -ySpd;
	}
}
