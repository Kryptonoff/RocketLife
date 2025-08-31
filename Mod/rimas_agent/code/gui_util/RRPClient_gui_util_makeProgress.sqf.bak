/*
	File: fn_makeProgress.sqf

	Description:
	Makes progress control inside given control group. 
*/

params [["_grp",controlNull],["_idc",-1],["_position",[0,0,0,0]],["_color",[1,1,1,1]],["_borderColor",[0,0,0,1]],["_tooltip",""]];
private _noGrp = (_grp isEqualType 0);
if (!_noGrp AND {isNull _grp}) exitWith {controlNull};
private _display = ctrlParent _grp; // Define display from controls group
if (isNull _display) exitWith {controlNull}; //Cancel if _display does not exist

// .hpp Border imitation (opt_fnc_makeStructuredText dependency)
disableSerialization;
private _borderPosition = [(_position select 0) - (0.5 * _pW),(_position select 1) - (0.5 * _pH),(_position select 2) + (1.5 * _pW),(_position select 3) + (1 * _pH)];
private _ctrl = [_grp,-1,_borderPosition,"","",0,"center","#FFFFFF","0",_borderColor] call RRPClient_gui_util_makeStructuredText;

// Progress bar
private _ctrl = if (_noGrp) then {
	_display ctrlCreate ["RscProgress", _idc];
} else {
	_display ctrlCreate ["RscProgress", _idc, _grp];
}; 
_ctrl ctrlSetTextColor _color;   
_ctrl ctrlSetPosition _position;  
_ctrl progressSetPosition 1;  
_ctrl ctrlSetTooltip _tooltip;
_ctrl ctrlCommit 0;
_ctrl 
