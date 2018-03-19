x += xSpd;
y += ySpd;
image_xscale *= 0.999;
image_yscale *= 0.999;
image_alpha *= 0.999;

depth = -bbox_bottom + 2000;

if (image_alpha < 0.1) instance_destroy();