/*
	
	Filename: 	RRPClient_admin_SendLootToAdmin.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP

*/
#include "..\script_macros.hpp"
private["_admin","_playerItems"];
_admin = param [0,objNull,[objNull]];

if (isNull _admin) exitWith {};

_playerItems = call RRPClient_util_getplayeritems;
[_playerItems] remoteExecCall ["RRPClient_admin_UnitLootInfo",_admin];