/*

	Filename: 	RRPClient_system_getCombatVehicleMenu.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP

*/
#include "..\..\script_macros.hpp"
disableSerialization;
if (isNull (findDisplay 5900)) then {
	createDialog "UnionDialogBattleVeh";
	waitUntil {!isNull (findDisplay 5900)};
};

private _control = CONTROL(5900,5902);
lbClear _control;

life_combatVehMarker = _this select 0;

private "_vehicleInfo";
{
	_vehicleInfo = [getText(_x >> "vehicleClass")] call RRPClient_util_fetchVehInfo;
	if !(EQUAL(_vehicleInfo,[])) then {
		_control lbAdd format["%1",_vehicleInfo select 3];
		_control lbSetData [(lbSize _control)-1,configName _x];
	};
} forEach ("true" configClasses (missionConfigFile >> "LifeCfgBattleVehicles"));