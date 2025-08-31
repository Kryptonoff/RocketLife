/*
	File: fn_makeAnchor.sqf

	Description:
	Makes an anchor group control inside given control group. 
*/

params [["_grp",controlNull],["_idc",-1]];
private _noGrp = (_grp isEqualType 0);
if (!_noGrp AND {isNull _grp}) exitWith {controlNull};
private _display = ctrlParent _grp; // Define display from controls group
if (isNull _display) exitWith {controlNull}; //Cancel if _display does not exist

private _ctrl = if (_noGrp) then {
	_display ctrlCreate ["RscControlsGroupNoScrollbars", _idc];
} else {
	_display ctrlCreate ["RscControlsGroupNoScrollbars", _idc, _grp];
};
_ctrl ctrlShow false;
_ctrl ctrlSetPosition [0,0,0.01,0.01];
_ctrl ctrlSetAutoScrollRewind true;
_ctrl ctrlCommit 0;
_ctrl