/*

	Filename: 	RRPClient_admin_PlayerQuery.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP

*/
#include "..\script_macros.hpp"
private _ret = param [0,objNull,[objNull]];
if (isNil "_ret") exitWith {};
if (isNull _ret) exitWith {};

private _licenses = [];
{
	_licenses pushBack (configName _x);
} forEach ("true" configClasses (missionConfigFile >> "LifeCfgLicenses"));

[BANK,CASH,FETCH_CONST(life_donator),_licenses,player] remoteExecCall ["RRPClient_admin_info",_ret];
