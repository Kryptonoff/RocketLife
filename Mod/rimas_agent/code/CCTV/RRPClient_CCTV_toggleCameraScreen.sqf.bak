/*
	Project: Rimas Role Play
	Author: FairyTale5571
	License: CC BY-ND
*/

private["_mode", "_display", "_hideControls"];
_mode = [1,0] select (_this);
_display = uiNamespace getVariable ["RRPDialogCCTV",displayNull];
if (isClass getMissionConfig "RRPDialogCCTV") then 
{
	_hideControls = getArray(getMissionConfig "RRPDialogCCTV" >> "hideControls");
}else{
	_hideControls = getArray(configFile >> "RRPDialogCCTV" >> "hideControls");
};
{
	if((ctrlClassName _x) in _hideControls)then
	{
		_x ctrlSetFade _mode;
		_x ctrlCommit 0.5;
	};
}forEach (allControls _display);
true
