/*
	
	Filename: 	RRPClient_system_medicSend.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP

*/
#include "..\..\script_macros.hpp"
private["_unit","_mode"];
_mode = param [0,0,[0]];

if (EQUAL((lbCurSel 34002),-1)) exitWith {};
_unit = CONTROL_DATA(34002);
_unit = objectFromNetId _unit;
if (isNil "_unit") exitWith {};
if (isNull _unit) exitWith {};
if (EQUAL(_unit,player)) exitWith {};

[player,_mode] remoteExecCall ["RRPClient_system_medicStatus",_unit];
