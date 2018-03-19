// Draw player & gun
if (weapon.shotFired) shader_set(shBright);
if (hitFlash > 0) shader_set(shHitFlash);

draw_self();

shader_reset();
