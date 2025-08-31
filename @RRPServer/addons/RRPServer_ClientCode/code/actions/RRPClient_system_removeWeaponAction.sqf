/*
	Filename: 	RRPClient_system_removeWeaponAction.sqf
	Project: 	Rimas Altis Life RPG
*/
#include "..\..\script_macros.hpp"
private _unit = param [0,ObjNull,[ObjNull]];
if(isNull _unit) exitWith {};
[format ["Поиск и конфискация нелегального снаряжения у %1",GVAR_RNAME(_unit)]] call hints;
if(player distance _unit > 5 || (call RRPClient_system_isInterrupted) || !alive _unit) exitWith {["Действие отменено"] call hints};
[player] remoteExecCall ["RRPClient_system_removeWeapons",_unit];
life_action_inUse = false;