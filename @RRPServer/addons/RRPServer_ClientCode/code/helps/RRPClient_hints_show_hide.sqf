/*
	Project: Rimas Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

if (!canSuspend) exitWith {_this spawn RRPClient_hints_show_hide};
if (isNull (uiNamespace getVariable ["HintsKeyboard",displayNull])) exitWith {};
private _display = uiNamespace getVariable ["HintsKeyboard",displayNull];
private _position = _display getVariable ["position",[]];
private _isHide = _display getVariable ["isHide",profileNamespace getVariable ["HelpsHided",false]];
private _group = _display displayCtrl 19930;

if (_isHide) then 
{
	_display setVariable ["isHide",false];
	profileNamespace setVariable ["HelpsHided",false];
	[_display, _group, _position, 0, 0.3] call RRPClient_gui_util_animateAllCtrl;
	waitUntil {ctrlCommitted _group};
	_group ctrlShow true;
}else{
	_display setVariable ["isHide",true];
	profileNamespace setVariable ["HelpsHided",true];
	[_display, _group,[(_position#0 + .5),_position#1,_position#2,_position#3], 1, 0.3] call RRPClient_gui_util_animateAllCtrl;
	waitUntil {ctrlCommitted _group};
	_group ctrlShow true;
};
saveProfileNamespace;
