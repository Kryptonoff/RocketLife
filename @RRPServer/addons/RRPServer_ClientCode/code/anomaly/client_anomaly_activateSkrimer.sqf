/*

	Filename: 	client_anomaly_activateSkrimer.sqf
	Project: 	Empyrean Life RPG
	Author:		RamboKZ
	E-mail:		armenia.roma@gmail.com
	Web:		http://empyrean.club

*/
#include "..\..\macros.hpp"
if (isServer) exitWith {};
params [["_trigger",objNull],["_triggerList",[]]];
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
	([_x] call RRPClient_system_isVehicleKind && {alive _x})
});

// проверяем наличие объектов, которые могут активировать аномалию
_triggerList = (_triggerList select {
    (isPlayer _x && {LSALIVE(_x)} && {NOTINVEH(_x)}) OR
	([_x] call RRPClient_system_isVehicleKind && {alive _x})
});

if (anomalyDebug) then {format["Anomaly:%1 | Trigger:%2 | Objects:%3",_type,_triggerList,_objectsList] call RRPClient_system_log};

if (EQUAL(_triggerList,[]) && EQUAL(_objectsList,[])) exitWith {"Springboard exitWith " call RRPClient_system_log};
// активируем аномалию, если в зоне активации есть объекты на которые она может сработать.
[_trigger,"anomaly_cooldown",true] call CBA_fnc_setVarNet;

// Оповещаем клиентов о срабатывании аномалии
// todo: можно оповещать только ближайших игроков
[_trigger,_type] remoteExecCall ["client_anomaly_particlesActive",RCLIENT];

private _sound = selectRandom ["horror_11s_1","horror_18s_2","horror_31s_3","horror_24s_4","horror_6s_5","horror_26s_6"];
private _time = switch (_sound) do {
	case "horror_11s_1": {11};
	case "horror_18s_2": {18};
	case "horror_31s_3": {31};
	case "horror_24s_4": {24};
	case "horror_6s_5": {6};
	case "horror_26s_6": {26};
	default {};
};

private _object = createSimpleObject ["Land_HelipadEmpty_F",[0,0,0]];
//private _object = "Land_HelipadEmpty_F" createVehicle [0,0,0];
private _timeRevert = (_time + 10) * (-1);
_object attachTo [player, [0, _timeRevert, 1]];
[_object,_sound] remoteExecCall ["RRPClient_system_say3D",RCLIENT];

if (EQUAL(LIFE_PPE_ANOMALY_SKRIMER,-1)) then {
    LIFE_PPE_ANOMALY_SKRIMER = ppEffectCreate ["ColorCorrections",1300];
    LIFE_PPE_ANOMALY_SKRIMER ppEffectAdjust [1, 1, -0.01, [0.21, 0, 0, 0.3], [0.21, 0, 0, 0.3], [1, 1, 1, 1]];
    LIFE_PPE_ANOMALY_SKRIMER ppEffectCommit 1;
    LIFE_PPE_ANOMALY_SKRIMER ppEffectEnable true;
    LIFE_PPE_ANOMALY_SKRIMER ppEffectForceInNVG true;
} else {
	LIFE_PPE_ANOMALY_SKRIMER ppEffectAdjust [1, 1, -0.01, [0.21, 0, 0, 0.3], [0.21, 0, 0, 0.3], [1, 1, 1, 1]];
    LIFE_PPE_ANOMALY_SKRIMER ppEffectCommit 1;
    LIFE_PPE_ANOMALY_SKRIMER ppEffectEnable true;
    LIFE_PPE_ANOMALY_SKRIMER ppEffectForceInNVG true;
};


[{
    params ["_args", "_pfhHandle"];
    _args params ["_object","_time","_effect","_damage"];
	if (LSNOTALIVE(player) OR _time == 0) exitWith {
	    [_pfhHandle] call CBA_fnc_removePerFrameHandler;
		detach _object;
		deleteVehicle _object;
		LIFE_PPE_ANOMALY_SKRIMER ppEffectEnable false;
		ppEffectDestroy LIFE_PPE_ANOMALY_SKRIMER;
		LIFE_PPE_ANOMALY_SKRIMER = -1;
	};

	//if (ppEffectEnabled LIFE_PPE_ANOMALY_SKRIMER) then {
	if (_effect) then {
		LIFE_PPE_ANOMALY_SKRIMER ppEffectAdjust [1, 1, 0,[ 0, 0, 0, 0],[ 1, 1, 1, 1],[ 0, 0, 0, 0]];
		LIFE_PPE_ANOMALY_SKRIMER ppEffectCommit 0.7;
		//LIFE_PPE_ANOMALY_SKRIMER ppEffectEnable false;
		_effect = false;
		_args set [2,_effect];
	} else {
		LIFE_PPE_ANOMALY_SKRIMER ppEffectAdjust [1, 1, -0.01, [0.21, 0, 0, 0.3], [0.21, 0, 0, 0.3], [1, 1, 1, 1]];
		LIFE_PPE_ANOMALY_SKRIMER ppEffectCommit 0.7;
		//LIFE_PPE_ANOMALY_SKRIMER ppEffectEnable true;
		_effect = true;
		_args set [2,_effect];
	};

	//if !(ppEffectEnabled LIFE_PPE_ANOMALY_SKRIMER) then {
	if !(_effect) then {
		if (speed player < 16) then {
			if (daytime >= 19 OR daytime <= 6) then {
				[player,"damage",_damage] call client_system_setDamage;
			} else {
				[player,"damage",_damage * 2] call client_system_setDamage;
			};
		};
	};

	_timeRevert = (_time + 10) * (-1);
	_object attachTo [player, [0, _timeRevert, 1]];
	_args set [1,_time - 1];
},1,[_object,_time - 1,true,_damage]] call CBA_fnc_addPerFrameHandler;

[_trigger] remoteExecCall ["client_anomaly_particlesDelete",RCLIENT];

// Выдерживаем паузу после нанесения урона (перезарядка аномалии)
[{
	[_this,"anomaly_cooldown",false] call CBA_fnc_setVarNet
},_trigger,_reloadTime + _time] call CBA_fnc_waitAndExecute;
