/*

	Filename: 	server_system_anomalyDelete.sqf
	Project: 	Empyrean Life RPG
	Author:		RamboKZ
	E-mail:		armenia.roma@gmail.com
	Web:		http://empyrean.club

*/
#include "..\macros.hpp"
if (!isServer) exitWith {};
private _anomalies = param [0,[]];
private _tmpHolder = anomalyHolder;
private _tmpTeleport = anomalyTeleportIDS;

_anomalies = if !(_anomalies isEqualType []) then {[_anomalies]} else {_anomalies};

{
	if (!isNull _x) then {
		_type = _x GVAR ["anomaly_type", ""];
		if !(_type isEqualTo "") then {
		    if (!isNil "anomalyDebug" && {anomalyDebug}) then {
			    deleteMarker (_x GVAR ["debug_marker",""]);
		    };
			[_x] remoteExecCall ["Client_anomaly_particlesDelete",-2];
			anomalyHolder = anomalyHolder - [_x];
			if (EQUAL(_type,"Teleport") OR EQUAL(_type,"Teleport_v2")) then {
			    anomalyTeleportIDS = anomalyTeleportIDS - [_x];
			};
			[{deleteVehicle _this},_x,0.5] call CBA_fnc_waitAndExecute;
		};
	};
} forEach _anomalies;

if !(_tmpHolder isEqualTo anomalyHolder) then {
    publicVariable "anomalyHolder";
};

if !(_tmpTeleport isEqualTo anomalyTeleportIDS) then {
    publicVariable "anomalyTeleportIDS";
};
