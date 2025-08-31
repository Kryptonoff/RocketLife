/*
	Filename: 	RRPClient_admin_Query.sqf
	Project: 	Rimas Altis Life RPG
*/
#include "..\script_macros.hpp"
disableSerialization;
private _info = call compile format["%1", CONTROL_DATA(2902)];
if(isNil "_info") exitWith {CONTROL(2900,2903) ctrlSetText "Игрока больше не существует?";};
if(isNull _info) exitWith {CONTROL(2900,2903) ctrlSetText "Игрока больше не существует?";};
CONTROL(2900,2903) ctrlSetText "Вы уже запрашиваете этого игрока.";
[player] remoteExecCall ["RRPClient_admin_PlayerQuery",_info];