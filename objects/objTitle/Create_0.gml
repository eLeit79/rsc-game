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
y = 0;
ySpd = 0;

yAngle = 180;

spaceAngle = 0;
escAngle = 0;
showText = false;
showEscText = false;
creditAlpha = 0;

alarm[0] = 3 * room_speed;

titleMusic = audio_play_sound(musTitle, 200, true);
