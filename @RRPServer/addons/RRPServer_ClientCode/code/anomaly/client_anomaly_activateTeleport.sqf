/*

	Filename: 	client_anomaly_activateTeleport.sqf
	Project: 	Empyrean Life RPG
	Author:		RamboKZ
	E-mail:		armenia.roma@gmail.com
	Web:		http://empyrean.club

*/
#include "..\..\macros.hpp"
if (isServer) exitWith {};
params[["_trigger",objNull],["_triggerList",[]]];
if (isNull _trigger) exitWith {};
if (_trigger GVAR ["anomaly_cooldown", false]) exitWith {};

private _teleporters = anomalyTeleportIDS;
private _exit = objNull;
_teleporters = _teleporters select {_trigger != _x};
_exit =  selectRandom _teleporters;

if (isNull _exit) exitWith {
	hint ("Не удалось найти выход для аномалии телепортации в " + str(getpos _trigger) + "!");
};

private _type = _trigger GVAR ["anomaly_type",""];
private _damage = M_CONFIG2(getNumber,"LifeCfgAnomaly","Settings",_type,"damage");
private _damageTypeObject = M_CONFIG2(getArray,"LifeCfgAnomaly","Settings",_type,"damageTypeObject");
private _damageRange = M_CONFIG2(getNumber,"LifeCfgAnomaly","Settings",_type,"damageRange");
private _damageDelay = M_CONFIG2(getNumber,"LifeCfgAnomaly","Settings",_type,"damageDelay");
private _damageOverTime = M_CONFIG2(getNumber,"LifeCfgAnomaly","Settings",_type,"damageOverTime");
private _damageOverTimeTick = M_CONFIG2(getNumber,"LifeCfgAnomaly","Settings",_type,"damageOverTimeTick");
private _damageOverTimeTickCount = M_CONFIG2(getNumber,"LifeCfgAnomaly","Settings",_type,"damageOverTimeTickCount");
private _reloadTime = M_CONFIG2(getNumber,"LifeCfgAnomaly","Settings",_type,"reloadTime");
if (anomalyDebug) then {format["CFG Anomaly:%1 | %2 |",_type,[_damage,_damageRange,_damageTypeObject,_damageDelay,_damageOverTime,_damageOverTimeTick,_damageOverTimeTickCount,_reloadTime]] call RRPClient_system_log};

// проверяем наличие объектов, которые могут активировать аномалию
private _objectsList = nearestObjects [getPos _trigger,[],_damageRange];
_objectsList = (_objectsList select {
    (isPlayer _x && {LSALIVE(_x)} && {NOTINVEH(_x)}) OR
	([_x] call RRPClient_system_isVehicleKind && {alive _x}) OR
	EQUAL(typeOf _x,life_anomalyBoltAmmo)
});

// проверяем наличие объектов, которые могут активировать аномалию
_triggerList = (_triggerList select {
    (isPlayer _x && {LSALIVE(_x)} && {NOTINVEH(_x)}) OR
	([_x] call RRPClient_system_isVehicleKind && {alive _x}) OR
	EQUAL(typeOf _x,life_anomalyBoltAmmo)
});

if (anomalyDebug) then {format["Anomaly:%1 | Trigger:%2 | Objects:%3",_type,_triggerList,_objectsList] call RRPClient_system_log};

if (EQUAL(_triggerList,[]) && EQUAL(_objectsList,[])) exitWith {"Electra exitWith " call RRPClient_system_log};
// активируем аномалию, если в зоне активации есть объекты на которые она может сработать.
[_trigger,"anomaly_cooldown",true] call CBA_fnc_setVarNet;
[_exit,"anomaly_cooldown",true] call CBA_fnc_setVarNet;

// Оповещаем клиентов о срабатывании аномалии
// todo: можно оповещать только ближайших игроков
[_trigger,_type] remoteExecCall ["client_anomaly_particlesActive",RCLIENT];
[_exit,_type] remoteExecCall ["client_anomaly_particlesActive",RCLIENT];

// активируем аномалию, если в зоне активации есть объекты на которые она может сработать.
[{
    params["_trigger","_exitPos","_objectsList"];
	{
		private _doTeleport = false;

        //Игрок
		if (isPlayer _x && {LSALIVE(_x)} && {NOTINVEH(_x)}) then {
			_doTeleport = true;
			if (local  _x) then {
				[] call client_anomaly_teleportFlash;
			} else {
				[] remoteExecCall ["client_anomaly_teleportFlash",_x];
			};
		} else {
			//Техника
	    	if ([_x] call RRPClient_system_isVehicleKind && {alive _x}) then {
			    if (getMass _x <= 10000) then {
			        _doTeleport = true;
			        {
				        if (local  _x) then {
				           [] call client_anomaly_teleportFlash;
				        } else {
				           [] remoteExecCall ["client_anomaly_teleportFlash",_x];
				        };
			        } forEach crew _x;
				};
			} else {
			    diag_log format["Anomaly:%3 | typeOf:%1 | Trigger:%2",typeOf _x,_triggerList,_type];
			    deleteVehicle _x;
		    };
		};

        if (_doTeleport) then {
            // Телепортируем
		    if (local  _x) then {
			    _x setPos [((_exitPos select 0) + (random 4) - 2), ((_exitPos select 1) + (random 4) - 2), (_exitPos select 2)];
		    } else {
			    [_x, [((_exitPos select 0) + (random 4) - 2), ((_exitPos select 1) + (random 4) - 2), (_exitPos select 2)]] remoteExecCall ["setPos",_x];
		    };
		};
	} forEach _objectsList;
},[_trigger,(getPos _exit),_objectsList],_damageDelay] call CBA_fnc_waitAndExecute;

// удаляем  статичный эфект аномалии
[_trigger] remoteExecCall ["client_anomaly_particlesDelete",RCLIENT];
[_exit] remoteExecCall ["client_anomaly_particlesDelete",RCLIENT];

// Выдерживаем паузу после активаци (перезарядка аномалии)
[{
	params ["_trigger","_exit"];
	[_trigger,"anomaly_cooldown",false] call CBA_fnc_setVarNet;
	[_exit,"anomaly_cooldown",false] call CBA_fnc_setVarNet;
},[_trigger,_exit],_reloadTime] call CBA_fnc_waitAndExecute;
