#include "..\..\script_macros.hpp"
params [
	["_unit", player, [objNull]], 
	["_damage", -1, [0]] 
];

if !(local _unit) exitWith {[_unit,_damage] remoteExecCall ["RRPClient_mut_setDamage",_unit]};
if (LSNOTALIVE(_unit)) exitWith {};
if (_damage in [1,0]) exitWith {_unit setDamage _damage};

private _final_damage = (damage _unit) + _damage;
private _isMutant = (typeOf _unit) in getArray(missionConfigFile >> "LifeCfgSettings" >> "life_mutantTypes");
if (_final_damage >= 0.89 AND {!_isMutant}) exitWith {[_unit,_unit] call RRPClient_dmg_Agony};

if (_isMutant) then {
	if (damage _unit >= 0.39) then {
		_unit setDamage 1;
	} else {
		_unit setDamage _final_damage;
	};
} else {
	_unit setDamage _final_damage;
};