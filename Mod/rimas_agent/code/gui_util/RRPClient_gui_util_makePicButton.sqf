/*
	File: fn_makePicButton.sqf

	Description:
	Makes button from picture inside given control group. 
*/

params [["_grp",controlNull],["_idc",-1],["_position",[0,0,0,0]],["_pictureIdle",""],["_picturePress",""],
["_code",""],["_tooltip",""],["_soundClick","button_click"],["_color",[1,1,1,1]]];
private _noGrp = (_grp isEqualType 0);
if (!_noGrp AND {isNull _grp}) exitWith {controlNull};
private _display = ctrlParent _grp; // Define display from controls group
if (isNull _display) exitWith {controlNull}; //Cancel if _display does not exist
private _ctrl = if (_noGrp) then {
	_display ctrlCreate ["RscPicture", _idc];
} else {
	_display ctrlCreate ["RscPicture", _idc, _grp];
};
_ctrl ctrlSetPosition _position;
_ctrl ctrlSetText _pictureIdle;
_ctrl ctrlSetBackgroundColor _color;
_ctrl ctrlEnable true;
_ctrl ctrlSetTooltip _tooltip;
_ctrl ctrlSetEventHandler ["mouseButtonUp",format['(_this select 0) ctrlSetText "%3";playSound "%2"; %1',_code,_soundClick,_pictureIdle]];
_ctrl ctrlSetEventHandler ["mouseButtonDown",format['(_this select 0) ctrlSetText "%1"',_picturePress]];
_ctrl ctrlCommit 0;
_ctrl;