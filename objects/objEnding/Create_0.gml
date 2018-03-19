InitView(0, GAME_HEIGHT);

camWidth = view_wport[0];
camHeight = view_hport[0];
camX = camWidth / 2;
camY = camHeight / 2;

camera = camera_create();
var vm = matrix_build_lookat(camX, camY, -10, camX, camY, 0, 0, 1, 0);
var pm = matrix_build_projection_ortho(camWidth, camHeight, 1, 10000);
camera_set_view_mat(camera, vm);
camera_set_proj_mat(camera, pm);
view_camera[0] = camera;

x = camWidth / 2;
y = 130;

state = endState.FADE_IN;
fadeAlpha = 1.0;

instance_create_layer(camX, camY + 50, "FunLayer", objEndingPlayer);

instance_create_layer(camX, camY + 75, "FunLayer", objEndingRedAlien);

var inst;
inst = instance_create_layer(camX - 32, camY + 70, "FunLayer", objEndingAlien);
inst.image_xscale = 0.8;
inst.image_yscale = 0.8;
inst = instance_create_layer(camX + 32, camY + 70, "FunLayer", objEndingAlien);
inst.image_xscale = 0.8;
inst.image_yscale = 0.8;

inst = instance_create_layer(camX - 48, camY + 60, "FunLayer", objEndingAlien);
inst.image_xscale = 0.5;
inst.image_yscale = 0.5;
inst = instance_create_layer(camX + 48, camY + 60, "FunLayer", objEndingAlien);
inst.image_xscale = 0.5;
inst.image_yscale = 0.5;

instance_create_layer(camX, camY + 66, "FloorLayer", objEndingFloor);
