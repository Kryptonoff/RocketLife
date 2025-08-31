/*
	File: fn_makeStaticPicture.sqf

	Description:
	Makes static picture control inside given control group. 
*/

params [["_grp",controlNull],["_idc",-1],["_position",[0,0,0,0]],["_picture",""],["_keepAspect", false],["_enable",false],["_color",[1,1,1,1]],["_tooltip",""]];
private _noGrp = (_grp isEqualType 0);
if (!_noGrp AND {isNull _grp}) exitWith {controlNull};
private _display = ctrlParent _grp; // Define display from controls group
if (isNull _display) exitWith {controlNull}; //Cancel if _display does not exist
private _rsc = if _keepAspect then {"RscPictureKeepAspect"} else {"RscPicture"};
private _ctrl = if (_noGrp) then {
	_display ctrlCreate [_rsc, _idc];
} else {
	_display ctrlCreate [_rsc, _idc, _grp];
};
_ctrl ctrlSetPosition _position;
_ctrl ctrlSetText _picture;
_ctrl ctrlSetTextColor _color;
_ctrl ctrlEnable _enable;
_ctrl ctrlSetTooltip _tooltip;
_ctrl ctrlCommit 0;
_ctrl;