/*

	Filename: 	RRPClient_system_setDeadState.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP

*/
#include "..\..\script_macros.hpp"
private _unit = param [0,ObjNull,[objNull]];

private _deathAnim = [_unit] call RRPClient_system_getDeathAnimation;

if (EQUAL(_deathAnim,"Unconscious") && !(NOTINVEH(_unit))) exitWith {
	[_unit] remoteExec ["RRPClient_system_pulloutVeh",_unit];
};

[_unit,_deathAnim] remoteExecCall ["RRPClient_system_animSync",RCLIENT];