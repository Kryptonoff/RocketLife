/*
	File: fn_makeStructuredText.sqf

	Description:
	Makes structured text control inside given control group. 
*/

params [
	["_grp",controlNull],
	["_idc",-1],
	["_position",[0,0,0,0]],
	["_text",""],
	["_font","PuristaLight"],
	["_size",0.8],
	["_align","left"],
	["_color","#000000"],
	["_shadow","0"],
	["_colorBack",[0,0,0,0]]
];
private _noGrp = (_grp isEqualType 0);
if (!_noGrp AND {isNull _grp}) exitWith {controlNull};
private _display = ctrlParent _grp; // Define display from controls group
if (isNull _display) exitWith {controlNull}; //Cancel if _display does not exist
if (_font isEqualTo '') then {_font = "PuristaLight"}; //Check if font name is not an empty string

private _ctrl = if (_noGrp) then {
	_display ctrlCreate ["RscStructuredText", _idc];
} else {
	_display ctrlCreate ["RscStructuredText", _idc, _grp];
};
_ctrl ctrlSetPosition _position;
if (_text isEqualType "") then {
	_ctrl ctrlSetStructuredText (parseText format ["<t shadow='%6' font='%5' align='%4' size='%2' color='%3'>%1</t>", _text,_size,_color, _align,_font,_shadow]);
};
if (_text isEqualType []) then {
	private _multiLineText = parseText "";
	{
		_multiLineText = composeText [_multiLineText, (parseText format ["<t shadow='%6' font='%5' align='%4' size='%2' color='%3'>%1</t>", _x,_size,_color, _align,_font,_shadow]), lineBreak];
	} forEach _text;
	_ctrl ctrlSetStructuredText _multiLineText;
};
if (_text isEqualType (parsetext "")) then {
	_ctrl ctrlSetStructuredText _text;
};
_ctrl setVariable ["format",[_size,_color, _align,_font,_shadow]];
_ctrl ctrlSetBackgroundColor _colorBack;
_ctrl ctrlEnable false;
_ctrl ctrlCommit 0;
_ctrl