/// @func ShakeCamera(shake)
/// @param {real} shake Amount to shake
var shake = argument0;
if (objCamera.shake < shake) objCamera.shake = shake;
