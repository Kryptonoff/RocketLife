/*
	File: fn_makeBackground.sqf

	Description:
	Makes background inside given control group. 
*/

params [["_grp",controlNull],["_idc",-1],["_position",[0,0,0,0]],["_color",[1,1,1,1]],["_enable",false],["_tooltip",""]];
private _noGrp = (_grp isEqualType 0);
if (!_noGrp AND {isNull _grp}) exitWith {controlNull};
private _display = ctrlParent _grp; // Define display from controls group
if (isNull _display) exitWith {controlNull}; //Cancel if _display does not exist
private _ctrl = if (_noGrp) then {
	_display ctrlCreate ["RscBackground", _idc];
} else {
	_display ctrlCreate ["RscBackground", _idc, _grp];
};
_ctrl ctrlSetPosition _position;
_ctrl ctrlSetBackgroundColor _color;
_ctrl ctrlEnable _enable;
_ctrl ctrlSetTooltip _tooltip;
_ctrl ctrlCommit 0;
_ctrl;