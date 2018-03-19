draw_self();

var w2 = camWidth / 2;
var h2 = camHeight / 2;

draw_set_font(fntTitle);
draw_set_halign(fa_center);

draw_set_color(c_white);
draw_text(w2, h2 - 30, "MISSION COMPLETE");

draw_set_color(c_gray);
draw_text(w2, h2 - 10, "Robo returned to base with the captured aliens,");
draw_text(w2, h2 + 2, "and the scientists did many cruel experiments on them...");

draw_set_color(c_yellow);
draw_text(w2, camHeight - 30, "Press SPACE to continue");

switch (state) {
	case endState.FADE_IN:
		fadeAlpha -= 0.025;
		if (fadeAlpha <= 0.0) {
			fadeAlpha = 0.0;
			state = endState.SHOW_ENDING;
		}
		break;

	case endState.FADE_OUT:
		fadeAlpha += 0.025;
		if (fadeAlpha >= 1.0) {
			fadeAlpha = 1.0;
			state = endState.DONE;
		}
		break;
}
if (state != endState.SHOW_ENDING) {
	draw_sprite_stretched_ext(sprPixelBlack, 0, 0, 0, camWidth, camHeight, c_white, fadeAlpha);
}
