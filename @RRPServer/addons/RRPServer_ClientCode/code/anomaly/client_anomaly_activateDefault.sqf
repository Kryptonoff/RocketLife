/*
	Filename: 	client_anomaly_activateDefault.sqf
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
private _anomalyPosition = [_trigger] call CBA_fnc_getPos;

// проверяем наличие объектов, которые могут активировать аномалию
private _objectsList = nearestObjects [_trigger,[],_damageRange];
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

// Оповещаем клиентов о срабатывании аномалии
// todo: можно оповещать только ближайших игроков
[_trigger,_type] remoteExec ["client_anomaly_particlesActive",RCLIENT];

// Выдерживаем паузу перед нанесением урона (пока на клиентах проигрывается нужная анимация)
[{
	// Наносим урон по области поражения аномалии
	_this call client_system_damageArea;
},[_trigger,_damageRange,_damage,_damageOverTime,_damageOverTimeTick,_damageOverTimeTickCount,_damageTypeObject,["HitEngine","HitBody"]],_damageDelay] call CBA_fnc_waitAndExecute;

// Выдерживаем паузу перед удалением (пока нанесется урон на клиентах)
[{
     // удаляем  статичный эфект аномалии
    [_this] remoteExecCall ["client_anomaly_particlesDelete",RCLIENT];
},_trigger,_damageDelay] call CBA_fnc_waitAndExecute;

// Выдерживаем паузу после нанесения урона (перезарядка аномалии)
[{
	[_this,"anomaly_cooldown",false] call CBA_fnc_setVarNet
},_trigger,_reloadTime + _damageDelay + random 10] call CBA_fnc_waitAndExecute;
