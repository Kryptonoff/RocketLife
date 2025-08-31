/*

	Filename: 	RRPClient_system_keyRecive.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP

*/
#include "..\..\script_macros.hpp"
private["_vehicle","_unit","_giver"];
_vehicle = _this select 0;
_unit = _this select 1;
_giver = _this select 2;
if(isNil "_unit" OR {isNil "_giver"}) exitWith {};
if(player == _unit && {!(_vehicle in life_vehicles)}) then {
	[format["%1 передал вам ключи от %2",_giver,getText(configOf _vehicle >> "displayName")]] call hints;
	life_vehicles pushBack _vehicle;		
	[steamid,_vehicle,1] remoteExecCall ["RRPServer_system_keyManagement",RSERV];
};