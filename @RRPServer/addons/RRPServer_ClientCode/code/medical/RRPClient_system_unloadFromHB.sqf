/*
	
	Filename: 	RRPClient_system_unloadFromHB.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP

*/
#include "..\..\script_macros.hpp"
private _unit = param [0,objNull,[objNull]];

if (LSINCAP(player)) then {
	player setPosATL (getPosATL _unit);
} else {
	moveOut player;	
};