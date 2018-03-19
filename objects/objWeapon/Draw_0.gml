if (weapon != global.weapons[NO_WEAPON]) {
	var ang = point_direction(x, y, mouse_x, mouse_y);
	var dx = lengthdir_x(1, ang);
	var dy = lengthdir_y(1, ang);

	if (shotFired) {
		shader_set(shBright);
		draw_sprite_ext(sprite_index, 0, x - dx * recoil, y - dy * recoil, 1, image_yscale, image_angle, c_white, 1);
		shader_reset();
		var sub = irandom(1);
		var gunLength = weapon[? "length"];
		draw_sprite_ext(sprMuzzleFlash, sub, x + dx * gunLength, y + dy * gunLength, 1, 1, ang, c_white, 1);
	} else {
		draw_sprite_ext(sprite_index, 0, x - dx * recoil, y - dy * recoil, 1, image_yscale, image_angle, c_white, 1);
	}
}
