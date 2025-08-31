/*

	Filename: 	client_system_setDamage.sqf
	Project: 	Empyrean Life RPG
	Author:		RamboKZ
	E-mail:		armenia.roma@gmail.com
	Web:		http://empyrean.club

*/
#include "..\..\macros.hpp"
params [
    ["_unit", objNull, [objNull]],
	["_mode", "", [""]],
	["_damage", -1, [0]]
];

if (isNull _unit) exitWith {};
if !(local _unit) exitWith {[_unit,_mode,_damage] remoteExecCall ["client_system_setDamage",_unit]};
if (_damage isEqualTo -1) exitWith {};
if (_mode isEqualTo "") exitWith {};
if (LSNOTALIVE(_unit)) exitWith {};

private _damageUnit = damage _unit;

switch (_mode) do {
	case "damage": {
		if ((_damageUnit + _damage) < 0.97) then {
			_unit setDamage (_damageUnit + _damage);
		} else {
		    if (_damage isEqualTo 1) then {
		        _unit setDamage 1;
			} else {
			    if (local _unit) then {
			        [_unit,_unit] call client_dmg_Agony;
			    } else {[_unit,_unit] remoteExecCall ["client_dmg_Agony",_unit]};
			};
		};
	};
	case "heal": {
		if ((_damageUnit - _damage) < 0) then {
			_unit setDamage 0;
		} else {
			_unit setDamage (_damageUnit - _damage);
		};
	};
	default {/* code */};
};
