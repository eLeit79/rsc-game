if (hitFlash > 0) {
	hitFlash--;
	shader_set(shHitFlash);
	draw_self();
	shader_reset();
} else {
	draw_self();
}
