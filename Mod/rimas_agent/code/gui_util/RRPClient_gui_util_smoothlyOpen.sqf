
_display = _this;
{
	[_display, _x, ctrlPosition _x, 1, 0] call RRPClient_gui_util_animateAllCtrl;
	[_display, _x, ctrlPosition _x, 0, 0.4] call RRPClient_gui_util_animateAllCtrl;
} forEach (allControls _display);

true