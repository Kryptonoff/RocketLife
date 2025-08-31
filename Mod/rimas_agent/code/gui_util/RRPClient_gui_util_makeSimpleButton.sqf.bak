/*
	File: fn_makeSimpleButton.sqf

	Description:
	Makes simple button inside given control group. 
*/

params [["_grp",controlNull],["_idc",-1],["_position",[0,0,0,0]],["_text",""],["_action",""],["_font","PuristaLight"],["_size",((pixelH * 5) * 90)],["_textColor",[1,1,1,1]],["_ctrlType","RscButton",[""]]];
private _noGrp = (_grp isEqualType 0);
if (!_noGrp AND {isNull _grp}) exitWith {controlNull};
private _display = ctrlParent _grp; // Define display from controls group
if (isNull _display) exitWith {controlNull}; //Cancel if _display does not exist
private _ctrl = if (_noGrp) then {
	_display ctrlCreate [_ctrlType, _idc];
} else {
	_display ctrlCreate [_ctrlType, _idc, _grp];
};
_ctrl ctrlSetPosition _position;
_ctrl ctrlSetTextColor _textColor;
_ctrl ctrlSetText _text;
_ctrl ctrlSetFont _font;
_ctrl ctrlSetFontHeight (0.034 * _size);
if (_action isEqualTo '') then {_ctrl ctrlEnable false} else {_ctrl ctrlEnable true};
_ctrl ctrlSetEventHandler ['ButtonClick',_action];
_ctrl ctrlCommit 0;
_ctrl;