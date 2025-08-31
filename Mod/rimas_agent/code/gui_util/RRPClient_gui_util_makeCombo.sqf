/*
	File: fn_makeCombo.sqf

	Description:
	Makes combo box inside given control group. 
*/

params [["_grp",controlNull],["_idc",-1],["_position",[0,0,0,0]],["_font","PuristaLight"],["_size",0.8],["_backgroundColor",[0.8,0.8,0.8,1]],["_textColor",[0,0,0,1]],['_isXBox',false,[false]]];
private _noGrp = (_grp isEqualType 0);
if (!_noGrp AND {isNull _grp}) exitWith {controlNull};
private _display = ctrlParent _grp; // Define display from controls group
if (isNull _display) exitWith {controlNull}; //Cancel if _display does not exist
_position params ['','','','_cH'];
private _type = if (_isXBox) then {"RscXListBox"} else {"RscCombo"};
private _ctrl = if (_noGrp) then {
	_display ctrlCreate [_type, _idc];
} else {
	_display ctrlCreate [_type, _idc, _grp];
};
_ctrl ctrlSetPosition _position;
_ctrl ctrlSetBackgroundColor _backgroundColor;
_ctrl ctrlSetTextColor _textColor;
_ctrl ctrlSetFont _font;
_ctrl ctrlSetFontHeight (_cH * 0.80);
_ctrl ctrlEnable true;
_ctrl ctrlCommit 0;
_ctrl;