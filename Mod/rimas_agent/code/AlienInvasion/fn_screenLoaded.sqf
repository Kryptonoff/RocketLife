disableSerialization;

params ["_display"];

setAperture 200;
showHud (shownHud apply {false});

private _laptopCtrl = _display displayCtrl 100;
private _ctrlGroup = uiNamespace getVariable ["AlienInvasionCtrlGroup", controlNull];

_display displayAddEventHandler ["KeyDown", 
{
	params ["_displayorcontrol", "_key", "_shift", "_ctrl", "_alt"];
	if (_key == 1) then
	{
		call KK_fnc_exitGameCleanup;
		[_displayorcontrol] spawn KK_fnc_deanimateLid;
		true
	};
}]; 

[_display, _laptopCtrl, _ctrlGroup] spawn KK_fnc_animateLid;

  