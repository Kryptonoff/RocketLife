/*

	Filename: 	client_anomaly_activateMeat.sqf
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
private _anomalyPos = [_trigger] call CBA_fnc_getPos;

// проверяем наличие объектов, которые могут активировать аномалию
private _objectsList = nearestObjects [_anomalyPos,[],_damageRange];
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

if (EQUAL(_triggerList,[]) && EQUAL(_objectsList,[])) exitWith {"Meat exitWith " call RRPClient_system_log};
// активируем аномалию, если в зоне активации есть объекты на которые она может сработать.
[_trigger,"anomaly_cooldown",true] call CBA_fnc_setVarNet;

// Оповещаем клиентов о срабатывании аномалии
// todo: можно оповещать только ближайших игроков
[_trigger,_type] remoteExecCall ["client_anomaly_particlesActive",RCLIENT];

{
	//Игрок
	if (isPlayer _x && {LSALIVE(_x)} && {NOTINVEH(_x)}) then {
		if (local _x) then {
			[_x, _anomalyPos,0.8,_damageDelay + 0.2] call client_anomaly_suckToLocation;
		} else {
			[_x,_anomalyPos,0.8,_damageDelay + 0.2] remoteExecCall ["client_anomaly_suckToLocation",_x];
		};
	} else {
		//Техника
        if ([_x] call RRPClient_system_isVehicleKind && {alive _x}) then {
		    if (local _x) then {
			    [_x, _anomalyPos,0.8,_damageDelay + 0.2] call client_anomaly_suckToLocation;
			} else {
				[_x,_anomalyPos,0.8,_damageDelay + 0.2] remoteExecCall ["client_anomaly_suckToLocation",_x];
			};
		} else {
		    diag_log format["Anomaly:%3 | typeOf:%1 | Trigger:%2",typeOf _x,_triggerList,_type];
		    deleteVehicle _x;
	    };
	};
} forEach _objectsList;

// Выдерживаем паузу перед нанесением урона (пока на клиентах проигрывается нужная анимация)
[{
    params["_trigger","_objectsList","_argDmg"];
	// Наносим урон по области поражения аномалии
    _argDmg call client_system_damageArea;

    {
		if (_x distance _trigger > (_argDmg # 1)) then {
			[_x] remoteExecCall ["client_anomaly_meatSplash"];
		};
    } forEach (_objectsList select {isPlayer _x && {LSALIVE(_x)} && {NOTINVEH(_x)}});
},[_trigger,_objectsList,[_anomalyPos,_damageRange,_damage,_damageOverTime,_damageOverTimeTick,_damageOverTimeTickCount,_damageTypeObject,["HitEngine","HitBody"]]],_damageDelay] call CBA_fnc_waitAndExecute;


// Выдерживаем паузу перед удалением (пока на клиентах проигрывается нужная анимация)
[{
     // удаляем  статичный эфект аномалии
    _this remoteExecCall ["client_anomaly_particlesDelete",RCLIENT];
},[_trigger],_damageDelay] call CBA_fnc_waitAndExecute;

// Выдерживаем паузу после нанесения урона (перезарядка аномалии)
[{
	[_this,"anomaly_cooldown",false] call CBA_fnc_setVarNet
},_trigger,_reloadTime + _damageDelay] call CBA_fnc_waitAndExecute;
