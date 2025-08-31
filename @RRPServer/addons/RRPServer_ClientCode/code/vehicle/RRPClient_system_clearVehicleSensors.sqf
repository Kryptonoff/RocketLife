/*

	Filename: 	RRPClient_system_clearVehicleSensors.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP

*/
#include "..\..\script_macros.hpp"
private _vehicle = param [0, Objnull, [Objnull]];
if (isNull _vehicle) exitWith {};
private _toOff = ["VisualSensorComponent", "ActiveRadarSensorComponent", "PassiveRadarSensorComponent"];
private _vehSensors = listVehicleSensors _vehicle; {
    if ((_x select 0) in _toOff) then {
        _vehicle enableVehicleSensor[_x select 0, false];
    };
}
forEach _vehSensors;