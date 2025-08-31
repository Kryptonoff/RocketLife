/*
	File: fn_makeCustom.sqf

	Description:
	Makes custom control inside given control group. 
*/

params [
	["_grp",controlNull],
	["_idc",-1],
	["_position",[0,0,0,0]],
	["_type","RscText",[""]]
];
private _noGrp = (_grp isEqualType 0);
if (!_noGrp AND {isNull _grp}) exitWith {controlNull};
private _display = ctrlParent _grp; // Define display from controls group
if (isNull _display) exitWith {controlNull}; //Cancel if _display does not exist

private _ctrl = if (_noGrp) then {
	_display ctrlCreate [_type, _idc];
} else {
	_display ctrlCreate [_type, _idc, _grp];
};
_ctrl ctrlSetPosition _position;
_ctrl ctrlEnable true;
_ctrl ctrlCommit 0;
_ctrl;