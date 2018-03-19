
if (doGenerate) {
	doGenerate = false;
	var mapWidth = 63;
	var mapHeight = 63;
	room_width = mapWidth * TILE_SIZE;
	room_height = mapHeight * TILE_SIZE;
	var mapGrid = GenerateLevel(mapWidth, mapHeight);
	
	if (layer_exists(global.collisionLayer)) layer_destroy(global.collisionLayer);
	global.collisionLayer = layer_create(0, "CollisionLayer");
	global.tmCollision = layer_tilemap_create(global.collisionLayer, 0, 0, tsCollision, mapWidth, mapHeight);
	layer_set_visible(global.collisionLayer, false);
	
	if (layer_exists(global.wallTops)) layer_destroy(global.wallTops);
	global.wallTops = layer_create(16, "WallTops");
	global.tmWallTops = layer_tilemap_create(global.wallTops, 0, 0, tsTiles, mapWidth, mapHeight);

	if (layer_exists(global.wallBottoms)) layer_destroy(global.wallBottoms);
	global.wallBottoms = layer_create(9900, "WallBottoms");
	global.tmWallBottoms = layer_tilemap_create(global.wallBottoms, 0, 0, tsTiles, mapWidth, mapHeight);

	if (layer_exists(global.floorLayer)) layer_destroy(global.floorLayer);
	global.floorLayer = layer_create(9900, "Floor");
	global.tmFloor = layer_tilemap_create(global.floorLayer, 0, 0, tsTiles, mapWidth, mapHeight);

	for (var yy = 0; yy < mapHeight; yy++) {
		for (var xx = 0; xx < mapWidth; xx++) {
			var data = tilemap_get(global.tmCollision, xx, yy);
			data = tile_set_index(data, mapGrid[# xx, yy]);
			tilemap_set(global.tmCollision, data, xx, yy);

			if (mapGrid[# xx, yy] > 0 && yy < mapHeight - 1 && mapGrid[# xx, yy + 1] == 0) {
				var data = tilemap_get(global.tmWallBottoms, xx, yy);
				data = tile_set_index(data, irandom_range(5, 7));
				tilemap_set(global.tmWallBottoms, data, xx, yy);
			}
			if (mapGrid[# xx, yy] > 0 && yy < mapHeight - 1 && mapGrid[# xx, yy + 1] > 0) {
				var data = tilemap_get(global.tmWallTops, xx, yy);
				data = tile_set_index(data, 10);
				tilemap_set(global.tmWallTops, data, xx, yy);
			}
			if (mapGrid[# xx, yy] == 0 && yy < mapHeight - 1 && mapGrid[# xx, yy + 1] > 0) {
				var data = tilemap_get(global.tmWallTops, xx, yy);
				data = tile_set_index(data, 9);
				tilemap_set(global.tmWallTops, data, xx, yy);
			}
			if (mapGrid[# xx, yy] == 1 && yy == mapHeight - 1) {
				var data = tilemap_get(global.tmWallTops, xx, yy);
				data = tile_set_index(data, 10);
				tilemap_set(global.tmWallTops, data, xx, yy);
			}
			if (mapGrid[# xx, yy] == 0 && yy == mapHeight - 1) {
				var data = tilemap_get(global.tmWallTops, xx, yy);
				data = tile_set_index(data, 9);
				tilemap_set(global.tmWallTops, data, xx, yy);
			}
			if (mapGrid[# xx, yy] == 0) {
				var data = tilemap_get(global.tmFloor, xx, yy);
				data = tile_set_index(data, irandom_range(1, 4));
				tilemap_set(global.tmFloor, data, xx, yy);
			}
		}
	}
	
	ds_grid_destroy(mapGrid);

	if (!instance_exists(objPlayer)) {
		var px = floor(room_width / 2);
		var py = floor(room_height / 2);
		instance_create_depth(px, py, py, objPlayer);
		instance_create_depth(mouse_x, mouse_y, 0, objCrosshairs);
	} else {
		objPlayer.x = room_width / 2;
		objPlayer.y = room_height / 2;
	}
	
} else {
	if (keyboard_check_released(vk_space)) doGenerate = true;
}
