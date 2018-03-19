draw_self();

if (showText) {
	draw_set_font(fntTitle);
	draw_set_halign(fa_center);
	draw_set_color(c_white);

	draw_text_color(camWidth / 2, camHeight / 2, "Press SPACE to get some!", c_yellow, c_yellow, c_yellow, c_yellow, sin(degtorad(spaceAngle)));
	spaceAngle += 2;
	if (spaceAngle >= 180.0) spaceAngle -= 180.0;
	if (!showEscText && spaceAngle >= 90.0) showEscText = true;

	if (showEscText) {
		draw_text_color(camWidth / 2, camHeight / 2 + 20, "Press ESCAPE to flee to the desktop", c_red, c_red, c_red, c_red, sin(degtorad(escAngle)));
		escAngle += 2;
		if (escAngle >= 180.0) escAngle -= 180.0;
	}

	draw_text_color(camWidth / 2, camHeight - 50, "CODE: Martin Enderleit (menderleit.itch.io)", c_gray, c_gray, c_gray, c_gray, creditAlpha);
	draw_text_color(camWidth / 2, camHeight - 38, "ART: Jack Pressnell (SomeFarang)", c_gray, c_gray, c_gray, c_gray, creditAlpha);
	draw_text_color(camWidth / 2, camHeight - 26, "FONT: Daniel Linssen (managore.itch.io)", c_gray, c_gray, c_gray, c_gray, creditAlpha);
	if (creditAlpha < 1.0) {
		creditAlpha += 0.1;
		if (creditAlpha >= 1.0) creditAlpha = 1.0;
	}
}
