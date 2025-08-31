/*

	Filename: 	RRPClient_dmg_dieInAgony.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP

*/
#include "..\script_macros.hpp"

private _unit = param [0,objNull,[objNull]];
if ((_unit isEqualTo player) and {!life_deathScreen_canRespawn}) exitWith {};
["all"] call RRPClient_system_removeBuff;
_unit setDamage 1;
