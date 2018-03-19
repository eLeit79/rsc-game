
if (state == endState.SHOW_ENDING) {
	if (keyboard_check_pressed(vk_space)) {
		state = endState.FADE_OUT;
	}
}

if (state == endState.DONE) {
	room_goto(rmTitle);
}
