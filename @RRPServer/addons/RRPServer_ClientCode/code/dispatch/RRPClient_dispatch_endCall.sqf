/*
	Project: Rimas Role Play
	Authors: Arrra & FairyTale5571
	License: CC BY-ND
*/

#include "..\..\script_macros.hpp"
private _display = uiNamespace getVariable ["RRPDialogTablet",displayNull];
private _mainGroup = _display displayCtrl 24001;
private _slide = _mainGroup controlsGroupCtrl 19000;

(_slide controlsGroupCtrl 6933) ctrlSetText "\rimas_dispatch\icons\bouton_call_ended.paa";

(_slide controlsGroupCtrl 6940) buttonSetaction "";
ctrlEnable [6940,false];

_with = player getVariable ["calling_with",objNull];
if (isNull _with) exitWith {};

player setVariable ["in_call",false,true];
_with setVariable ["in_call",false,true];
// [_with] remoteExec ["max_phone_fnc_callEnd",player];
// [player] remoteExec ["max_phone_fnc_callEnd",_with];
