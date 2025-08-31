/*
	Filename: 	RRPClient_admin_Compensate.sqf
	Project: 	Rimas Altis Life RPG
*/
#include "..\script_macros.hpp"
private["_value"];
if(FETCH_CONST(life_adminlevel) == 0) exitWith {};
_value = 10000;
[[player,"cash","add",_value], "system_moneyChange"] call RRPClient_system_hcExec;
["ADMINCASH",format["%1 (%2) compensated $10k",GVAR_RNAME(player),steamid]] remoteExecCall ["TON_fnc_customLog",RSERV];
[format ["Вы добавили себе $%1",[_value] call RRPClient_util_numberText],""] call hints;