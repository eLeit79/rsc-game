if (hitFlash > 0) {
	hitFlash--;
	shader_set(shHitFlash);
	draw_self();
	shader_reset();
} else {
	draw_self();
}

if (state = enemyState.KNOCKED_OUT) {
	hpAlpha = 1.0;
	var kp = (knockoutTime * room_speed) - knockoutTimer;
	draw_sprite_ext(sprEnemyHealth, 0, x, bbox_bottom + 3, 1, 1, 0, c_white, hpAlpha);
	draw_sprite_stretched_ext(sprEnemyKnockedDot, 0, x - 8, bbox_bottom + 3, kp * knockSegments, 1, c_white, hpAlpha * image_alpha);
} else {
	draw_sprite_ext(sprEnemyHealth, 0, x, bbox_bottom + 3, 1, 1, 0, c_white, hpAlpha);
	draw_sprite_stretched_ext(sprEnemyHealthDot, 0, x - 8, bbox_bottom + 3, hp * hpSegments, 1, c_white, hpAlpha * image_alpha);
}
