/*
	Filename: 	RRPClient_system_removeLegcuffs.sqf
	Project: 	Rimas Altis Life RPG
*/
#include "..\..\script_macros.hpp"
private _target = cursorObject;
if (isNull _target OR (!(_target isKindOf "Man")) OR (!alive _target)) exitWith {};
if !(_target GVAR ["isArrested",false]) exitWith {};
if (_target GVAR ["karma",0] > 0) exitWith {["Этот человек был помещен в тюрьму за нарушение правил. Зря проделал такой путь..."] call hints};
[_target,"isArrested"] call RRPClient_system_clearGlobalVar;
[2,format["%1 сорвал ваш тюремный номер. Самое время бежать!",GVAR_RNAME(player)]] remoteExecCall ["RRPClient_system_broadcast",_target];
["Вы сорвали тюремный номер с заключенного!"] call hints;
