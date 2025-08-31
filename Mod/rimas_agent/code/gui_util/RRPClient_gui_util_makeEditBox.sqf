/*
	File: fn_makeEditBox.sqf

	Description:
	Makes text edit box inside given control group. 
*/

params [["_grp",controlNull],["_idc",-1],["_position",[0,0,0,0]],["_font","PuristaLight"],["_size",0.8],["_text",""],["_backgroundColor",[0.5,0.5,0.5,1]],["_textColor",[1,1,1,1]]];
private _noGrp = (_grp isEqualType 0);
if (!_noGrp AND {isNull _grp}) exitWith {controlNull};
private _display = ctrlParent _grp; // Define display from controls group
if (isNull _display) exitWith {controlNull}; //Cancel if _display does not exist
private _ctrl = if (_noGrp) then {
	_display ctrlCreate ["RscEdit", _idc];
} else {
	_display ctrlCreate ["RscEdit", _idc, _grp];
};
_ctrl ctrlSetPosition _position;
_ctrl ctrlSetBackgroundColor _backgroundColor;
_ctrl ctrlSetText _text;
_ctrl ctrlSetTextColor _textColor;
_ctrl ctrlSetFont _font;
_ctrl ctrlSetFontHeight (0.034 * _size);
_ctrl ctrlEnable true;
_ctrl ctrlCommit 0;
_ctrl;