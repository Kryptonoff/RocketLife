/*

	Filename: 	RRPClient_system_setTag.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP

*/
#include "..\..\script_macros.hpp"
call RRPClient_system_tagConfig;

[player,"realname",player call getFullName] call CBA_fnc_setVarNet;
if (count RRPClientGroupInfo isNotEqualTo 0  /* OLD: life_myTagID isEqualTo "" */) then {	
	[player,"realname",format["[%1] %2",RRPClientGroupInfo get "name",player call getFullName]] call CBA_fnc_setVarNet;
	[player,"realtag",call RRPClient_groups_util_getRankName] call CBA_fnc_setVarNet;
};

[["life_myTagID",life_myTagID,getPlayerUID player],"session_updateSettings"] call RRPClient_system_hcExec;
