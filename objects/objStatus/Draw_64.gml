//draw_sprite(sprStatus, 0, 2, 2);
//draw_sprite_stretched(sprSuit, 0, 27, 4, objPlayer.suitIntegrity * 0.5, 4);
//draw_sprite_stretched(sprOxygen, 0, 27, 14, objPlayer.oxygen * 0.5, 4);

draw_sprite(sprHPLeftCap, 0, 10, 10);
var hpx = 15;
for (var i = 0; i < objPlayer.maxHp; i++) {
	if (objPlayer.hp > i) {
		draw_sprite(sprHPSliver, 0, hpx, 10);
	} else {
		draw_sprite(sprHPSliverEmpty, 0, hpx, 10);
	}
	hpx += 4;
}
draw_sprite(sprHPRightCap, 0, hpx, 10);

var rocketX = display_get_gui_width() - 12;
for (var i = 0; i < objPlayer.maxRockets; i++) {
	if (objPlayer.rockets > i) {
		draw_sprite(sprRocketUI, 0, rocketX, 12);
	} else {
		draw_sprite(sprRocketUI, 1, rocketX, 12);
	}
	rocketX -= 8;
}

switch (transState) {
	case transitionState.FADE_IN:
		if (transitionHeight > 0) {
			transitionTimer++;
			if (transitionTimer >= transitionInterval) {
				transitionTimer = 0;
				transitionHeight -= transitionSkip;
			}
		} else {
			transitionTimer = 0;
			transState = transitionState.IDLE;
		}
		break;

	case transitionState.FADE_OUT:
		if (transitionHeight < transitionSlideHeight) {
			transitionTimer++;
			if (transitionTimer >= transitionInterval) {
				transitionTimer = 0;
				transitionHeight += transitionSkip;
			}
		} else {
			transitionTimer = 0;
			transState = transitionState.IDLE;
		}
		break;

	case transitionState.IDLE:
		break;
}
for (var yy = 0; yy < objCamera.camHeight; yy += transitionSlideHeight) {
	draw_sprite_stretched(sprPixelBlack, 0, 0, yy, objCamera.camWidth, transitionHeight);
}
