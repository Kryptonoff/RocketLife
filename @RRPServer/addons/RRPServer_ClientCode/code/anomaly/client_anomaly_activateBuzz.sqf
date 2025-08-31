/*

	Filename: 	client_anomaly_activateBuzz.sqf
	Project: 	Empyrean Life RPG
	Author:		RamboKZ
	E-mail:		armenia.roma@gmail.com
	Web:		http://empyrean.club

*/
#include "..\..\macros.hpp"
if (isServer) exitWith {};
params[["_trigger",objNull],["_triggerList",[]]];
if (isNull _trigger) exitWith {};
if (_trigger GVAR ["anomaly_cooldown", false] && {life_anomalyCooldown}) exitWith {};
_trigger SVAR ["anomaly_cooldown",true];
life_anomalyCooldown = true;

private _type = _trigger GVAR ["anomaly_type",""];
private _anomalyPos = [_trigger] call CBA_fnc_getPos;
private _damage = M_CONFIG2(getNumber,"LifeCfgAnomaly","Settings",_type,"damage");
private _damageTypeObject = M_CONFIG2(getArray,"LifeCfgAnomaly","Settings",_type,"damageTypeObject");
private _damageRange = M_CONFIG2(getNumber,"LifeCfgAnomaly","Settings",_type,"damageRange");
private _reloadTime = M_CONFIG2(getNumber,"LifeCfgAnomaly","Settings",_type,"reloadTime");
if (anomalyDebug) then {format["CFG Anomaly:%1 | %2 |",_type,[_damage,_damageRange,_damageTypeObject,_reloadTime]] call RRPClient_system_log};

private _objects = nearestObjects [_anomalyPos,_damageTypeObject,_damageRange];
if (anomalyDebug) then {
	diag_log format["Anomaly:%3 near:%1 | Trigger:%2",_objects,_triggerList,_type];
};

private _player = vehicle player;

if (vehicle player in _objects && {LSALIVE(_player)} && {NOTINVEH(_player)}) then {
	[_player,"damage",_damage] call client_system_setDamage;
	[_player,"buzz_hit",50] remoteExecCall ["RRPClient_system_say3D",RCLIENT];
} else {
	if ([_player] call RRPClient_system_isVehicleKind) then {} else {
	    {
	        diag_log format["Anomaly:%3 | near:%1 | Trigger:%2",_objects,_triggerList,_type];
	        deleteVehicle _x;
		} forEach _objects;
	};
};

[{
	_this SVAR ["anomaly_cooldown",false];
	life_anomalyCooldown = false;
}, _trigger, _reloadTime] call CBA_fnc_waitAndExecute;
