/*
	Project: Rimas Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/
#include "..\..\script_macros.hpp"
disableSerialization;
params ["_control","_index"];
private _display = uiNamespace getVariable ["RRPDialogTablet",displayNull];
private _mainGroup = _display displayCtrl 24001;
private _slide = _mainGroup controlsGroupCtrl 34000;

private _unit = objectFromNetId (_control lbData _index);

private _control = _slide controlsGroupCtrl 34011;
_position = getPosWorld _unit;
if (isNull _control || _position isEqualTo []) exitWith {};

_control ctrlMapAnimAdd[1,0.1,_position];
ctrlMapAnimCommit _control;