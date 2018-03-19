enum ammoTypes {
	NONE,
	BULLET
}

#macro NO_WEAPON 0
#macro ROBOT_GUN 1

global.weapons[NO_WEAPON] = ds_map_create();
ds_map_add(global.weapons[NO_WEAPON], "sprite", -1);
ds_map_add(global.weapons[NO_WEAPON], "recoil", 0);
ds_map_add(global.weapons[NO_WEAPON], "pushBack", 0);
ds_map_add(global.weapons[NO_WEAPON], "damage", 0);
ds_map_add(global.weapons[NO_WEAPON], "ammoType", ammoTypes.NONE);
ds_map_add(global.weapons[NO_WEAPON], "projectile", -1);
ds_map_add(global.weapons[NO_WEAPON], "length", 0);
ds_map_add(global.weapons[NO_WEAPON], "rateOfFire", 0);
ds_map_add(global.weapons[NO_WEAPON], "bulletSpeed", 0);
ds_map_add(global.weapons[NO_WEAPON], "spread", 0);
ds_map_add(global.weapons[NO_WEAPON], "automatic", false);

global.weapons[ROBOT_GUN] = ds_map_create();
ds_map_add(global.weapons[ROBOT_GUN], "sprite", sprPlayerGun);
ds_map_add(global.weapons[ROBOT_GUN], "recoil", 4);
ds_map_add(global.weapons[ROBOT_GUN], "pushBack", 8);
ds_map_add(global.weapons[ROBOT_GUN], "damage", 1);
ds_map_add(global.weapons[ROBOT_GUN], "ammoType", ammoTypes.BULLET);
ds_map_add(global.weapons[ROBOT_GUN], "projectile", objBullet);
ds_map_add(global.weapons[ROBOT_GUN], "length", sprite_get_bbox_right(sprPlayerGun)-sprite_get_xoffset(sprPlayerGun));
ds_map_add(global.weapons[ROBOT_GUN], "rateOfFire", 8);
ds_map_add(global.weapons[ROBOT_GUN], "bulletSpeed", 12);
ds_map_add(global.weapons[ROBOT_GUN], "spread", 4);
ds_map_add(global.weapons[ROBOT_GUN], "automatic", true);
