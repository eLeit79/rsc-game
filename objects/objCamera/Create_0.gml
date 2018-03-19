/// @description Setup camera
InitView(0, GAME_HEIGHT);

camWidth = view_wport[0];
camHeight = view_hport[0];
camX = x;
camY = y;
camLerp = 0.25;

width2 = camWidth / 2;
height2 = camHeight / 2;
if (room_width > camWidth) {
	if (x < width2) {
		x = width2;
	}
	if (x > room_width - width2) {
		x = room_width - width2;
	}
} else {
	x = room_width / 2;
}

if (room_height > camHeight) {
	if (y < height2) {
		y = height2;
	}
	if (y > room_height - height2) {
		y = room_height - height2;
	}
} else {
	y = room_height / 2;
}

followObject = undefined;
camera = camera_create();
var vm = matrix_build_lookat(x, y, -10, x, y, 0, 0, 1, 0);
var pm = matrix_build_projection_ortho(camWidth, camHeight, 1, 10000);
camera_set_view_mat(camera, vm);
camera_set_proj_mat(camera, pm);
view_camera[0] = camera;

xGunShake = 0;
yGunShake = 0;

shake = 0;
