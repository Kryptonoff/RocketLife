/*

	Filename: 	RRPClient_admin_Kick.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP

*/
#include "..\script_macros.hpp"
if(FETCH_CONST(life_adminlevel) == 0) exitWith {closeDialog 0;};
private["_unit"];
_unit = call compile format["%1", CONTROL_DATA(2902)];
if(isNil "_unit" OR isNull _unit) exitwith {closeDialog 0;};

["kick",getPlayerUID _unit,"Admin Ingame Kick","Rocket Quick Kick"] remoteExecCall ["RRPServer_system_serverCommand",RSERV];