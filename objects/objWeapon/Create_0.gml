canFire = true;
shotFired = false;
recoil = 0;
rofCooldown = 0;
xWeaponOffset = sign(objPlayer.image_xscale) * -6;
yWeaponOffset = -10;

weapon = global.weapons[ROBOT_GUN];
sprite_index = weapon[? "sprite"];
