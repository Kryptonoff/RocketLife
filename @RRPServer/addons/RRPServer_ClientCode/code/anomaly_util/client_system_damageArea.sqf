/*

	Filename: 	client_system_damageArea.sqf
	Project: 	Empyrean Life RPG
	Author:		ArmStalker edit by RamboKZ
	E-mail:		armenia.roma@gmail.com
	Web:		http://empyrean.club

    Description:
	    Наносит постепенный урон по области (сфера), исходя из центра сферы и радиуса, в котором должен быть нанесен урон.
		Может быть запущено несколько обработчиков для одной области (таким образом урон может накапливаться)

    Параметры:
	    _damagePosition            {array/object}   - коордитнаты центра сферы внутри которой должен быть нанесен урон
	    _damageRange               {number}         - радиус сферы
		_damage                    {number}         - мгновенный урон
	    _damageOverTime            {number}         - постепенный урон
	    _damageOverTimeTick        {number}         - интервал с которым должен наноститься постепенный урон
	    _damageOverTimeTickCount   {number}         - количество интервалов (постепенного урона)
	    _damageTypeObject          {array}          - типы объектов по которым должен быть нанесен урон
		_damageHitPoint            {array}          - урон по опередоному hitPoint'у (пока тока техника)
	Returns:
	    false/true
*/
#include "..\..\macros.hpp"
params [
    ["_damagePosition",[],[[],objNull]],
	["_damageRange",5,[0]],
	["_damage",0,[0]],
	["_damageOverTime",0,[0]],
	["_damageOverTimeTick",0,[0]],
	["_damageOverTimeTickCount",1,[0]],
	["_damageTypeObject",["CAManBase","LandVehicle","Air","Ship"],[[]]],
	["_damageHitPoint",[],[[]]]
];

//Блоки от неправильных введенных данных
if (_damagePosition isEqualType objNull && {isNull _damagePosition}) exitWith {false};
if (_damagePosition isEqualType [] && {EQUAL(_damagePosition,[])}) exitWith {false};
if (EQUAL(_damage,0) && {EQUAL(_damageOverTime,0)}) exitWith {false};

if (_damageOverTime > 0 && {EQUAL(_damage,0)}) then {
    format["client_system_damageArea OverTime:%1",[_damagePosition,_damageRange,_damageOverTime,_damageOverTimeTick,_damageOverTimeTickCount,_damageHitPoint]] call client_system_log;
	// наносим постепенный урон, тем кто находится в зоне поражаения
	//[_x,_damageOverTime,_damageOverTimeTick,_damageOverTimeTickCount,_damagePosition,_damageRange,_damageHitPoint] call client_system_damageOverTime;
	[_damagePosition,_damageRange,_damageOverTime,_damageOverTimeTick,_damageOverTimeTickCount,_damageHitPoint] remoteExecCall ["client_system_damageOverTime",-2];
} else {
    // forEach - объекты, которым можно нанести урон.
    private _objects = (nearestObjects [_damagePosition,_damageTypeObject,_damageRange]);
    if (EQUAL(_objects,[])) exitWith {false};
	format["client_system_damageArea OverTime:%1",[_damagePosition,_damageRange,_damage,_damageHitPoint]] call client_system_log;
    {
	    // наносим мгновенный урон, тем кто находится в зоне поражаения
    	if (_damage > 0) then {
	        if (isPlayer _x && {LSALIVE(_x)} && {NOTINVEH(_x)}) then {
			   //Игрок
		       [_x,"damage",_damage] call client_system_setDamage;
    	    } else {
			   //Техника
			    private _vehicle = _x;
			    if ([_vehicle] call client_system_isVehicleKind && {alive _x}) then {
				    {
					//Пока для техники нет функции нанесения урона
					    if (local _vehicle) then {
                            _vehicle setHitPointDamage [_x, ((_vehicle getHitPointDamage _x) + _damage)];
					    } else {
                            [_vehicle, [_x, ((_vehicle getHitPointDamage _x) + _damage)]] remoteExecCall ["setHitPointDamage", _vehicle];
					    };
				    } forEach _damageHitPoint;
			    } else {
				    //Хуй знает что
				    format["DamageArea  delete unknown object | TypeOf:%1 | Name:%2",typeOf _x,name _x] call client_system_log;
		            deleteVehicle _x;
		        };
		    };
        };
    } forEach _objects;
};

true
