/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

if !(isServer) exitWith {true};
private ["_vehicle","_killer","_instigator","_effect","_id","_namekiller","_uidKiller"];
_vehicle = _this select 0;
_killer = _this select 1;
_instigator = _this select 2;
_effect = _this select 3;
_id = _vehicle getVariable ["RRPDatabaseID",-1];
_namekiller = name _killer;
_uidKiller = getPlayerUID _killer;

if !(isPlayer _killer or {isNull _killer}) then
{
	_namekiller = "НЕИЗВЕСТНО КЕМ";
	_uidKiller = "UIDA НЕТ";
};

[_vehicle,format ["Уничтожена %1 (%2)",_namekiller,_uidKiller]] call RRPServer_vehicle_delete;
_vehicle call RRPServer_vehicleSaveQueue_removeVehicle;
format ["VehicleKilled - ID:%2 - %1",_this,_id] call RRPServer_util_log;
[format ["VEH: %1 ID: %2 killer %3 instigator: %4 effect %5",typeOf _vehicle,_id,name _killer,name _instigator,_effect],"VehicleKilled_Log"] call RRPServer_system_logIt;

true
