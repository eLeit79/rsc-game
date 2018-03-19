/// @func InitView(view, height);
/// @desc Initialize the viewport and resize app surface
/// @arg {real} view Id of the view to setup
/// @arg {real} height Height in pixels of the view
var view = argument0;
var height = argument1;

// Get the current window size and aspect ratio
var aspect = window_get_width() / window_get_height();
var viewHeight = height;
var viewWidth = viewHeight * aspect;

// Update the viewport to use the full window size
view_wport[view] = viewWidth;
view_hport[view] = viewHeight;
surface_resize(application_surface, viewWidth, viewHeight);
