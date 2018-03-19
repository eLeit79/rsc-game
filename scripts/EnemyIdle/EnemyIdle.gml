stateTime--;
if (stateTime <= 0) {
	state = enemyState.WALK;
	stateTime = irandom_range(30, 90);
	
	dir = random(360);
	xSpd = lengthdir_x(moveSpeed, dir);
	ySpd = lengthdir_y(moveSpeed, dir);
	
//	tmCollision = layer_tilemap_get_id("CollisionLayer");
//	dirs = ds_list_create();
//	if (!TileCollision(tmCollision, bbox_left - 16, bbox_top, bbox_right - 16, bbox_bottom)) {
//		ds_list_add(dirs, DIR_LEFT);
//	}
//	if (!TileCollision(tmCollision, bbox_left + 16, bbox_top, bbox_right + 16, bbox_bottom)) {
//		ds_list_add(dirs, DIR_RIGHT);
//	}
//	if (!TileCollision(tmCollision, bbox_left, bbox_top - 16, bbox_right, bbox_bottom - 16)) {
//		ds_list_add(dirs, DIR_UP);
//	}
//	if (!TileCollision(tmCollision, bbox_left, bbox_top + 16, bbox_right, bbox_bottom + 16)) {
//		ds_list_add(dirs, DIR_DOWN);
//	}
	
//	dir = dirs[| irandom(ds_list_size(dirs) - 1)];
//	show_debug_message("Dir: " + string(dir));
//	switch (dir) {
//		case DIR_LEFT:
//			xSpd = -moveSpeed;
//			break;
//		case DIR_RIGHT:
//			xSpd = moveSpeed;
//			break;
//		case DIR_UP:
//			ySpd = -moveSpeed;
//			break;
//		case DIR_DOWN:
//			ySpd = moveSpeed;
//			break;
//	}
}
