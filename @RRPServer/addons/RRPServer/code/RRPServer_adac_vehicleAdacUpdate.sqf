/*

	Filename: 	fn_vehicleAdacUpdate.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/
	
	Тюнинг:
	Формат [["boxes",3],["nitro"]]
*/

params [
    ["_vehicle",objNull,[objNull]],
    ["_config",[],[[]]],
	"_plate",
	"_uid"
];

"vehicleAdacUpdate - work" call RRPServer_DB_log;
if (isNull _vehicle) exitWith {}; //NULL

_dbInfo = _vehicle getVariable ["dbInfo",[]];
if (_dbInfo isEqualTo []) exitWith {};
_id = _vehicle getVariable ["RRPDatabaseID",-1];
format ["vehicleAdacUpdate:%1:%2",_config,_id] call RRPServer_DB_fireAndForget;
