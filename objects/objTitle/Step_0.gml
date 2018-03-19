ySpd += 0.075;
y += ySpd;
if (ySpd > 0.0 && y >= 150) {
	y = 150;
	ySpd = -ySpd * 0.44;
}

if (keyboard_check(vk_space)) {
	audio_sound_gain(titleMusic, 0, 1);
	room_goto_next();
}
if (keyboard_check(vk_escape)) {
	game_end();
}
