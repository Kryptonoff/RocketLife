/*

	Filename: 	RRPClient_system_canUsePhone.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP

*/
#include "..\..\script_macros.hpp"
private _isPhone = false;

{
	if (["tf_", _x] call RRPClient_util_xString && (_x != "tf_microdagr")) exitWith {_isPhone = true};
} forEach (assignedItems player);

if (_isPhone) exitWith {true};

if (([cursorObject] call RRPClient_util_getModelName) in ["phonebooth_01_f","phonebooth_02_f"]) exitWith {true};

false