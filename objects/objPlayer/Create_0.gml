/// @description Insert description here
// You can write your code in this editor

baseSpeed = 2.5;
window_set_cursor(cr_none);

camera = instance_create_layer(x, y, "Instances", objCamera);
camera.followObject = object_index;


xSpd = 0;
ySpd = 0;
xKnock = 0;
yKnock = 0;

maxHp = 5;
hp = maxHp;
invincible = 0;
hitFlash = 0;

weapon = instance_create_depth(x, y + 3, bbox_bottom - 1, objWeapon);

maxRockets = 3;
rockets = maxRockets;

state = playerState.NORMAL;

instance_create_depth(mouse_x, mouse_y, 0, objCrosshairs);
//audio_play_sound(sndRoboMustCollect, 101, false);

roboCanSpeak = true;

audio_listener_position(x, y, 0);
audio_listener_orientation(x, y + 1, 0, 0, 0, 1);
