/*
	Filename: 	RRPClient_parking_CopMenu.sqf
	Project: 	Rimas Altis Life RPG
*/
#include "..\script_macros.hpp"
private _veh = param [0,ObjNull,[ObjNull]];
if (isNull _veh) exitWith {};
if !([_veh] call RRPClient_system_isVehicleKind) exitWith {};
if (!alive _veh) exitWith {};

disableSerialization;
if (!isNull (findDisplay 37400)) then {closeDialog 0};
createDialog "UnionDialogParkingCop";
waitUntil {!isNull (findDisplay 5500)};

private _title = CONTROL(5500,5501);
_title ctrlSetText format["Звакуация %1",(getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "displayName"))];

life_vInact_curTarget = _veh;