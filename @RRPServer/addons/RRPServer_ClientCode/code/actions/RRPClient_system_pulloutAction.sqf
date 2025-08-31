/*
	Filename: 	RRPClient_system_pulloutAction.sqf
	Project: 	Rimas Altis Life RPG
*/
#include "..\..\script_macros.hpp"
private _veh = param [0,objNull,[objNull]];
if (unitIsUAV _veh) exitWith {};
if (player distance _veh > ((boundingBox _veh select 1) select 0) + 2) exitWith { ["Вы находитесь слишком далеко от объекта"] call hints };
private _crew = crew _veh;

{
	[player] remoteExec ["RRPClient_system_pulloutVeh",_x];
} foreach _crew;