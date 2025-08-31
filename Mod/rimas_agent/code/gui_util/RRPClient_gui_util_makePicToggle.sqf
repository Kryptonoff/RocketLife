/*
	File: fn_makePicToggle.sqf

	Description:
	Makes toggle picture button inside given control group. 
*/

params [["_grp",controlNull],["_idc",-1],["_position",[0,0,0,0]],["_pictureOn",""],["_pictureOff",""],
["_state",false],["_code",""],["_tooltip",""],["_soundClick","button_click"],["_color",[1,1,1,1]]];
private _noGrp = (_grp isEqualType 0);
if (!_noGrp AND {isNull _grp}) exitWith {controlNull};
private _display = ctrlParent _grp; // Define display from controls group
if (isNull _display) exitWith {controlNull}; //Cancel if _display does not exist
private _ctrl = if (_noGrp) then {
	_display ctrlCreate ["RscPicture", _idc];
} else {
	_display ctrlCreate ["RscPicture", _idc, _grp];
};
_ctrl setVariable ["state",_state];
_ctrl ctrlSetPosition _position;
_ctrl ctrlSetText (if (_state) then {_pictureOn} else {_pictureOff});
_ctrl ctrlSetBackgroundColor _color;
_ctrl ctrlEnable true; 
_ctrl ctrlSetTooltip _tooltip;
_ctrl ctrlSetEventHandler ["mouseButtonUp",format['disableSerialization;_ctrl = (_this select 0);if ((ctrlParent _ctrl) getVariable ["busy",false]) exitWith {};_state = _ctrl getVariable ["state",false];_state = !_state;_ctrl setVariable ["state",_state];if (_state) then {_ctrl ctrlSetText "%3"} else {_ctrl ctrlSetText "%4"}; playSound "%2";%1',_code,_soundClick,_pictureOn, _pictureOff]];
_ctrl ctrlCommit 0;
_ctrl;