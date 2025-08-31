/*

	Filename: 	client_system_damageOverTime.sqf
	Project: 	Empyrean Life RPG
	Author:		RamboKZ
	E-mail:		armenia.roma@gmail.com
	Web:		http://empyrean.club

    Description:
	    Наносит постепенный урон переденному объекту, исходя из центра сферы и радиуса, в котором должен быть нанесен урон.
	    Может быть запущено несколько обработчиков для одного объекта (таким образом урон может накапливаться)

    Параметры:
	    _damageObject              {object}   - коордитнаты центра сферы внутри которой должен быть нанесен урон
	    _damageOverTime            {number}         - постепенный урон
	    _damageOverTimeTick        {number}         - интервал с которым должен наноститься постепенный урон
	    _damageOverTimeTickCount   {number}         - количество интервалов (постепенного урона)
	    _damageTypeObject          {array}          - типы объектов по которым должен быть нанесен урон
		_damageHitPoint            {array}          - урон по опередоному hitPoint'у (пока тока техника)
		_damagePosition            {array/object}   - коордитнаты центра сферы внутри которой должен быть нанесен урон
		_damageRange               {number}         - радиус сферы

*/
#include "..\..\macros.hpp"
params [
    ["_damagePosition",objNull,[[],objNull]],
	["_damageRange",5,[0]],
	["_damageOverTime",0,[0]],
	["_damageOverTimeTick",0,[0]],
	["_damageOverTimeTickCount",1,[0]],
	["_damageHitPoint",["HitHull"],[[]]]
];

if (_damagePosition isEqualType [] && {EQUAL(_damagePosition,[])}) exitWith {false};
if (_damagePosition isEqualType objNull && {isNull _damagePosition}) exitWith {false};
if (player distance _damagePosition > (200 + _damageRange)) exitWith {format["client_system_damageOverTime - distance > 200: %1 ",player distance _damagePosition] call client_system_log; false};

_this pushBack CBA_missionTime;

[{
  /*private _damagePosition            = _this # 0;
    private _damageRange               = _this # 1;
	private _damageOverTime            = _this # 2;
	private _damageOverTimeTick        = _this # 3;
	private _damageOverTimeTickCount   = _this # 4;
	private _damageHitPoint            = _this # 5;
	private _startTime                 = _this # 6;*/

	params [
        "_damagePosition",
		"_damageRange",
        "_damageOverTime",
        "_damageOverTimeTick",
        "_damageOverTimeTickCount",
        "_damageHitPoint",
        "_startTime"
    ];

	private _damageObject = vehicle player;
	if ((CBA_missionTime - _damageOverTimeTick) > _startTime) then {
	    if ((_damageObject distance _damagePosition) < _damageRange) then {
		    if (LSALIVE(_damageObject) && {NOTINVEH(_damageObject)}) then {
				[_damageObject,"damage",_damageOverTime] call client_system_setDamage;
		    } else {
			    if ([_damageObject] call client_system_isVehicleKind && {alive _damageObject}) then {
				    {
						if (local _damageObject) then {
                            _damageObject setHitPointDamage [_x, ((_damageObject getHitPointDamage _x) + _damageOverTime)];
						} else {
                            [_damageObject, [_x, ((_damageObject getHitPointDamage _x) + _damageOverTime)]] remoteExecCall ["setHitPointDamage", _damageObject];
						};
					} forEach _damageHitPoint;
		        };
			};
		};
		_this set [4,_damageOverTimeTickCount - 1];
		_this set [6,CBA_missionTime];
	};

	(_damageOverTimeTickCount == 0)
},{format["client_system_damageOverTime waitUntil _this: %1 ",_this] call client_system_log},_this] call CBA_fnc_waitUntilAndExecute;
