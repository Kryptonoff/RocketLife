/*

	Filename: 	fn_vehicleAdacRecolor.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
/*
params [
    ["_vehicle",objNull,[objNull]],
    ["_color","",""],Эта херь когда-то работала, но я хз что за формат у  _vehicle поэтому - так.
	"_plate","_uid"
];*/

private _vehicle = param [0];
private _color = param [1];

if (isNull _vehicle) exitWith {diag_log "repaintVehicle canceled!";};
"vehicleAdacRecolor - work" call RRPServer_DB_log;

_dbInfo = _vehicle getVariable ["dbInfo",[]];
if (_dbInfo isEqualTo []) exitWith {};
_id = _vehicle getVariable ["RRPDatabaseID",-1];
format ["vehicleAdacRecolor:%1:%2",_color,_id] call RRPServer_DB_fireAndForget;
