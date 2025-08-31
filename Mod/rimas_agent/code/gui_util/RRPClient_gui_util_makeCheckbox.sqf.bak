/*
	File: fn_makeCheckbox.sqf

	Description:
	Makes checkbox inside given control group. 
*/

params [["_grp",controlNull],["_idc",-1],["_position",[0,0,0,0]],["_checked",false],["_onCheck",""],["_enable",true],["_tooltip",""]];
private _noGrp = (_grp isEqualType 0);
if (!_noGrp AND {isNull _grp}) exitWith {controlNull};
private _display = ctrlParent _grp; // Define display from controls group
if (isNull _display) exitWith {controlNull}; //Cancel if _display does not exist
private _ctrl = if (_noGrp) then {
	_display ctrlCreate ["RscCheckBox", _idc];
} else {
	_display ctrlCreate ["RscCheckBox", _idc, _grp];
};
_ctrl ctrlSetPosition _position;
_ctrl ctrlEnable _enable;
_ctrl cbSetChecked _checked;
_ctrl ctrlSetTooltip _tooltip;
_ctrl ctrlSetEventHandler ["checkedChanged",_onCheck];
_ctrl ctrlCommit 0;
_ctrl;