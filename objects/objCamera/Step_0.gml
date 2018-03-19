/// @description Update camera

// Camera movement
if (followObject != undefined) {
	camX = followObject.x;
	camY = followObject.y;
}

// Limit camera movement to map edges
width2 = camWidth / 2;
height2 = camHeight / 2;
if (room_width > camWidth) {
	if (camX < width2) {
		camX = width2;
	}
	if (camX > room_width - width2) {
		camX = room_width - width2;
	}
} else {
	camX = room_width / 2;
}

if (room_height > camHeight) {
	if (camY < height2) {
		camY = height2;
	}
	if (camY > room_height - height2) {
		camY = room_height - height2;
	}
} else {
	camY = room_height / 2;
}

// Provide a way to quit in fullscreen mode (ESCAPE)
if (keyboard_check(vk_escape)) {
	game_end();
}

// Update camera to follow this object smoothly
x = lerp(x, camX, camLerp);
y = lerp(y, camY, camLerp);
x += xGunShake;
y += yGunShake;
xGunShake *= 0.9;
yGunShake *= 0.9;
x += random_range(-shake, shake);
y += random_range(-shake, shake);
shake *= 0.925;

var vm = matrix_build_lookat(x, y, -10, x, y, 0, 0, 1, 0);
var pm = matrix_build_projection_ortho(camWidth, camHeight, 1, 10000);
camera_set_view_mat(camera, vm);
camera_set_proj_mat(camera, pm);
