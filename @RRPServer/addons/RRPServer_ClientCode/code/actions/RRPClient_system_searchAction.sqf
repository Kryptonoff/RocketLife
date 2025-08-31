/*
	Filename: 	RRPClient_system_searchAction.sqf
	Project: 	Rimas Altis Life RPG
*/
#include "..\..\script_macros.hpp"
private["_unit"];
_unit = param [0,ObjNull,[ObjNull]];
if(isNull _unit) exitWith {};
["Поиск..."] call hints;
uiSleep 2;
if(player distance _unit > 5 || {(call RRPClient_system_isInterrupted)} || {!alive _unit}) exitWith { ["Такой человек не найден."] call hints };
[player] remoteExecCall ["RRPClient_system_searchClient",_unit];
call RRPClient_actions_inUse;